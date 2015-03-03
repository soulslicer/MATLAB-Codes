
SETUP

In this directory there are some codes adapted from two toolboxes. They can be used
for depth recovery and visualization. You will have to run the script run_me_to_setup 
before you can actually use the package. And if your matlab is not associated 
with any installed C/C++ compiler, it is necessary to do it first. You can just 
type the following command

                      mex -setup

and then follow the instructions. Usually the default choices will work.


HOW TO USE IT

In question 4, you are required to estimate the fundamental matrix from n (n at least 
8) correspondences of two images. You should provide a function estimateF() to do
it. The definition of estimateF() will be as follows

                function F = estimateF(x1, x2)

where x1 is the 2xn image coordinates of the first image, x2 is 2xn image coordinates 
of the second image, and F will be the estimated fundamental matrix.

There is currently a function estimateF() in the same directory; this is just a dummy
that provides a fictitious F for testing purpose when you are first setting up this package. 
(after running the script run_me_to_setup, you can test the package by running the demo 
script mydemo). After you have tested that the package is running, you should just 
replace this dummy estimateF by having your own implementation of the actual esimtateF. The 
function will be called in the SFM pipeline for 3D reconstruction.

After implementing your function estimateF(), you can finally try the whole SFM
pipeline. You can use the same demo script mydemo for this purpose. If you wish to
further modify the codes for your own purpose, check mydemo to see how to pack your 
correspondences, call the reconstruction function, and visualize the final results. 
Note that the reconstructed points are related to the actual points by a projective 
transformation, so they may look distorted. Note also that the camera pose is also 
output in the final plot.


Should you have any problems, feel free to contact the GA via email (given on the 
course website) or go to the GA's lab at E4 #08-25.

