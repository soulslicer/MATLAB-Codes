#!/usr/bin/ python 

# GUI
import sys
from PyQt4 import QtGui, uic

# CV
import cv2
import numpy as np
import time

# ROS
import roslib
import rospy
from sensor_msgs.msg import Image
from sensor_msgs.msg import CompressedImage
from cv_bridge import CvBridge, CvBridgeError

# Algorithms
from math import atan2, degrees, pi, radians, sqrt
from skimage import feature
from sklearn.svm import LinearSVC, SVC

# External
from UI import SonarWindow
from Learning import CvLearning
from Ros import PipelineROS
from Algorithms import CvAverage
from Algorithms import *
import sonar_pixel
from sonar_pixel import *

class PipelineAlgo():

    def __init__(self):
        self.ros = PipelineROS(process_callback=self.sonar_callback, settings_callback=self.settings_callback)
        self.cvAverage = CvAverage(width=640, height=480, maxSize=3)
        self.cvMovement = CvMovement(maxSize=5, smallestDistance=2000)

        self.data = None
        self.data_list = []

        self.threshold = 100
        self.area = 40
        self.sonarImageMouse = (0,0)
        self.cameraImageMouse = (0,0)

    def save_data(self):

        RTheta = sonar_pixel[self.sonarImageMouse[0]][self.sonarImageMouse[1]]

        if self.data is not None:
            self.data_list.append([
                self.sonarImageMouse[0],    # Sonar Mouse X
                self.sonarImageMouse[1],    # Sonar Mouse Y
                RTheta[0],                  # Sonar R
                RTheta[1],                  # Sonar Theta
                self.cameraImageMouse[0],   # Camera Mouse X
                self.cameraImageMouse[1],   # Camera Mouse Y
                self.data["DVL"][0],        # Pose X
                self.data["DVL"][1],        # Pose Y
                self.data["DVL"][2],        # Pose Z
                self.data["IMU_Euler"][0],  # Pose R
                self.data["IMU_Euler"][1],  # Pose P
                self.data["IMU_Euler"][2],  # Pose Y
                self.data["IMU_Quart"][0],  # Pose XQ
                self.data["IMU_Quart"][1],  # Pose YQ
                self.data["IMU_Quart"][2],  # Pose ZQ
                self.data["IMU_Quart"][3],  # Pose WQ
                self.data["Depth"],         # Depth

            ])
        print "SAVED"
        # matrix = np.matrix(self.data_list)
        # print self.data_list

    def write_data(self, filename):
        f = open(filename,'w')
        for dataset in self.data_list:
            for item in dataset:
                f.write("%s " % str(round(item,3)))
            f.write("\n")
        f.close()

    def get_sonar_pixel(self, x, y):
        rospy.wait_for_service('sonar_pixel')
        try:
            sp = rospy.ServiceProxy('sonar_pixel', sonar_pixel)
            resp = sp(x, y)
            return resp.range, resp.bearing
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e

    def settings_callback(self, settings):

        print settings

        for key in settings.keys():
            value = settings[key]
            if key == "Threshold":
                self.threshold = value
            if key == "SonarImageMouse":
                self.sonarImageMouse = value
            if key == "CameraImageMouse":
                self.cameraImageMouse = value
            if key == "SaveData":
                self.save_data()
            if key == "WriteData":
                self.write_data(value)

    def sonar_callback(self):

        """""""""""""""""""""""""""""""""
        Copy all data
        """""""""""""""""""""""""""""""""

        self.data = self.ros.get_data()

        # Make a copy of the data (NO ERROR CHECKING FOR TIMESTAMP AS OF NOW)
        try:
            sonarImage = self.data["SonarImage"].copy()
            cameraImage = self.data["CameraImage"].copy()
        except Exception as ex:
            print str(ex)
            return None, None, None, None
        print "Data"
        """""""""""""""""""""""""""""""""
        Sonar Post Processing
        """""""""""""""""""""""""""""""""

        # Remove water noise through running average
        sonarImage = cv2.GaussianBlur(sonarImage,(5,5),0)
        self.cvAverage.add_image(sonarImage)
        sonarImage = self.cvAverage.process_image()
        sonarProcessed = sonarImage.copy()
        sonarImage = cv2.cvtColor(sonarImage, cv2.COLOR_RGBA2GRAY)
        
        # Thresholding
        ret,thresholdedImage = cv2.threshold(sonarImage,self.threshold,255,cv2.THRESH_BINARY)
        thresholdedImage = cv2.dilate(thresholdedImage,None,iterations = 3)
        thresholdedImage = cv2.erode(thresholdedImage,None,iterations = 3)
        ctr,heir = cv2.findContours(thresholdedImage,cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)

        # Feature extraction
        newCtr = []
        frameArray = []
        for cnt in ctr:

            # Approx of contour
            #cnt = cv2.approxPolyDP(cnt,0.001*cv2.arcLength(cnt,True),True)

            # Get centroid
            M = cv2.moments(cnt)
            if M['m00'] == 0:
                continue
            centroid_x = int(M['m10']/M['m00'])
            centroid_y = int(M['m01']/M['m00'])
            cv2.circle(sonarProcessed,(centroid_x,centroid_y), 2, (0,0,255), -1)

            # Angle
            if len(cnt) < 6:
                continue
            (angx,angy),(MA,ma),angle = cv2.fitEllipse(cnt)
            angle = round(angle, 2)

            # Check area/param
            area = cv2.contourArea(cnt)
            perimeter = cv2.arcLength(cnt,True)
            if area < self.area or area > 20000:
                continue

            # Assign data to dictionary
            item={
                "Class": str(len(frameArray)),
                "Contour": cnt,
                "ShapeAngle": angle,
                "X": centroid_x,
                "Y": centroid_y,
            }
            frameArray.append(item)

            cv2.drawContours(sonarProcessed, [cnt], 0, (0,255,0), 1)

        # Compute movements
        movements = self.cvMovement.process_array(frameArray)

        # Get closest point to mouse point for sonar
        sonarROI = self.get_closest_to_point(sonarProcessed, 50, self.sonarImageMouse, frameArray)

        # Draw data
        for item in frameArray:
            if item.has_key("MovementDistance"):
                newCtr.append(item["Contour"])
                if item["MovementDistance"] > 1:
                    RTheta = sonar_pixel[item["X"]][item["Y"]]
                    cv2.putText(sonarProcessed, str(RTheta[0])+" m" + " " + str(RTheta[1]) + " degrees" , (item["X"],item["Y"]), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255,255,0))
                    self.cvMovement.draw_arrow(sonarProcessed, (item["X"],item["Y"]), radians(item["MovementAngle"]+180), item["MovementDistance"]*5, (255,0,255))


        # Visualization without spatial noise - Wasn't used
        # blank = np.zeros((480,640), np.uint8)
        # cv2.fillPoly(blank, pts =newCtr, color=(255,255,255))
        # ret, blank = cv2.threshold(blank,254,255,cv2.THRESH_BINARY)
        # final = cv2.bitwise_and(sonarImage,sonarImage,mask = blank)

        """""""""""""""""""""""""""""""""
        Camera Post Processing
        """""""""""""""""""""""""""""""""

        # Camera
        cameraProcessed = cameraImage.copy()

        cameraROI = self.get_closest_to_point(cameraProcessed, 50, self.cameraImageMouse, None)
        
        return cameraROI, sonarROI, sonarProcessed, cameraProcessed
        #return cv2.cvtColor(sonarImage, cv2.COLOR_RGBA2GRAY)

    def get_closest_to_point(self, img, maxDist, mouse, frameArray):
        shortestDistance = 1000
        closestItem = None
        roi = None
        try:
            if frameArray is None:
                tl = {"X": mouse[0] - maxDist, "Y": mouse[1] - maxDist}
                tr = {"X": mouse[0] + maxDist, "Y": mouse[1] - maxDist}
                br = {"X": mouse[0] + maxDist, "Y": mouse[1] + maxDist}
                bl = {"X": mouse[0] - maxDist, "Y": mouse[1] + maxDist}
                roi = img[tr["Y"]:br["Y"], tl["X"]:tr["X"]]
            else:
                for item in frameArray:
                    dist = sqrt( (item["X"] - mouse[0])**2 + (item["Y"] - mouse[1])**2 )
                    if dist < shortestDistance:
                        shortestDistance = dist
                        closestItem = item
                if shortestDistance > maxDist:
                    closestItem = None
                if closestItem != None:
                    tl = {"X": closestItem["X"] - maxDist, "Y": closestItem["Y"] - maxDist}
                    tr = {"X": closestItem["X"] + maxDist, "Y": closestItem["Y"] - maxDist}
                    br = {"X": closestItem["X"] + maxDist, "Y": closestItem["Y"] + maxDist}
                    bl = {"X": closestItem["X"] - maxDist, "Y": closestItem["Y"] + maxDist}
                    roi = img[tr["Y"]:br["Y"], tl["X"]:tr["X"]]
        except:
            return None

        return roi

if __name__ == '__main__':

    sonar_algo = PipelineAlgo()
    rospy.spin()

    # app = QtGui.QApplication(sys.argv)
    # window = SonarWindow(sonar_algo=sonar_algo)
    # sys.exit(app.exec_())