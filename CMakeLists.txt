cmake_minimum_required(VERSION 3.0.2)
project(agimus_msgs)

find_package(catkin REQUIRED COMPONENTS
  std_msgs roscpp rospy std_msgs message_generation
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  TrajectorySample.msg
  Vector.msg
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
 CATKIN_DEPENDS std_msgs roscpp rospy std_msgs message_runtime
)
