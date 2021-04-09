# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "movement: 7 messages, 0 services")

set(MSG_I_FLAGS "-Imovement:/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(movement_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg" NAME_WE)
add_custom_target(_movement_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement" "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg" "actionlib_msgs/GoalID:movement/MoveGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg" NAME_WE)
add_custom_target(_movement_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement" "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg" ""
)

get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg" NAME_WE)
add_custom_target(_movement_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement" "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg" ""
)

get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg" NAME_WE)
add_custom_target(_movement_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement" "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:movement/MoveFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg" NAME_WE)
add_custom_target(_movement_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement" "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg" "actionlib_msgs/GoalID:movement/MoveResult:actionlib_msgs/GoalStatus:movement/MoveActionResult:movement/MoveActionGoal:movement/MoveGoal:std_msgs/Header:movement/MoveActionFeedback:movement/MoveFeedback"
)

get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg" NAME_WE)
add_custom_target(_movement_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement" "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:movement/MoveResult:std_msgs/Header"
)

get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg" NAME_WE)
add_custom_target(_movement_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement" "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
)
_generate_msg_cpp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
)
_generate_msg_cpp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
)
_generate_msg_cpp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
)
_generate_msg_cpp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
)
_generate_msg_cpp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
)
_generate_msg_cpp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
)

### Generating Services

### Generating Module File
_generate_module_cpp(movement
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(movement_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(movement_generate_messages movement_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_cpp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_cpp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_cpp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_cpp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg" NAME_WE)
add_dependencies(movement_generate_messages_cpp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_cpp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_cpp _movement_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_gencpp)
add_dependencies(movement_gencpp movement_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
)
_generate_msg_eus(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
)
_generate_msg_eus(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
)
_generate_msg_eus(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
)
_generate_msg_eus(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
)
_generate_msg_eus(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
)
_generate_msg_eus(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
)

### Generating Services

### Generating Module File
_generate_module_eus(movement
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(movement_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(movement_generate_messages movement_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_eus _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_eus _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_eus _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_eus _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg" NAME_WE)
add_dependencies(movement_generate_messages_eus _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_eus _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_eus _movement_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_geneus)
add_dependencies(movement_geneus movement_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
)
_generate_msg_lisp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
)
_generate_msg_lisp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
)
_generate_msg_lisp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
)
_generate_msg_lisp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
)
_generate_msg_lisp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
)
_generate_msg_lisp(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
)

### Generating Services

### Generating Module File
_generate_module_lisp(movement
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(movement_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(movement_generate_messages movement_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_lisp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_lisp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_lisp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_lisp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg" NAME_WE)
add_dependencies(movement_generate_messages_lisp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_lisp _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_lisp _movement_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_genlisp)
add_dependencies(movement_genlisp movement_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
)
_generate_msg_nodejs(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
)
_generate_msg_nodejs(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
)
_generate_msg_nodejs(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
)
_generate_msg_nodejs(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
)
_generate_msg_nodejs(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
)
_generate_msg_nodejs(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
)

### Generating Services

### Generating Module File
_generate_module_nodejs(movement
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(movement_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(movement_generate_messages movement_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_nodejs _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_nodejs _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_nodejs _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_nodejs _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg" NAME_WE)
add_dependencies(movement_generate_messages_nodejs _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_nodejs _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_nodejs _movement_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_gennodejs)
add_dependencies(movement_gennodejs movement_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
)
_generate_msg_py(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
)
_generate_msg_py(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
)
_generate_msg_py(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
)
_generate_msg_py(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
)
_generate_msg_py(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
)
_generate_msg_py(movement
  "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
)

### Generating Services

### Generating Module File
_generate_module_py(movement
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(movement_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(movement_generate_messages movement_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_py _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_py _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveGoal.msg" NAME_WE)
add_dependencies(movement_generate_messages_py _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_py _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveAction.msg" NAME_WE)
add_dependencies(movement_generate_messages_py _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(movement_generate_messages_py _movement_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/movement/build/devel/share/movement/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(movement_generate_messages_py _movement_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_genpy)
add_dependencies(movement_genpy movement_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(movement_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(movement_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(movement_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(movement_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(movement_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
