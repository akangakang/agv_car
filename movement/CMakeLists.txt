cmake_minimum_required(VERSION 3.0.2)
project(movement)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  genmsg 
  actionlib_msgs
  actionlib

)

add_action_files(DIRECTORY action FILES Move.action)
generate_messages(DEPENDENCIES actionlib_msgs)

catkin_package(
  CATKIN_DEPENDS
  actionlib actionlib_msgs roscpp std_msgs
)

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  ${PROJECT_SOURCE_DIR}/include
  ${catkin_INCLUDE_DIRS}
  ${PROJECT_SOURCE_DIR}/../../devel/include
)

add_executable(move_server src/move_server.cpp)
add_executable(move_client src/move_client.cpp)

target_link_libraries(
  move_server
  ${catkin_LIBRARIES}
)

target_link_libraries(
        move_client
        ${catkin_LIBRARIES}
)