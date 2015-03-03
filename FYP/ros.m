setenv('ROS_MASTER_URI','http://127.0.0.1:11311')
setenv('ROS_IP','127.0.0.1')
Node = rosmatlab.node('Test','http://localhost:11311');
subscriber = Node.addSubscriber('/sonar_processed/', 'sensor_msgs/Image', 10);
subscriber.addCustomMessageListener({@test_fun, Node.Node});