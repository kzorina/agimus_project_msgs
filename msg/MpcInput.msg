# MpcInput.msg
# This message represents the state of a robot, including joint values, velocities, accelerations, 
# and the target end-effector pose.

# Joint positions (rad or meters for prismatic joints)
# Length of the list should match the number of robot joints
float64[] q
# Corresponding cost weights
float64[] q_w

# Joint velocities (rad/s or m/s for prismatic joints)
# Length should match the number of robot joints
float64[] qdot
# Corresponding cost weights
float64[] qdot_w

# Joint accelerations (rad/s^2 or m/s^2 for prismatic joints)
# Length should match the number of robot joints
float64[] qddot
# Corresponding cost weights
float64[] qddot_w

# Target end-effector pose in the robot's base frame
# Pose includes position (x, y, z) and orientation as a quaternion (x, y, z, w)
geometry_msgs/Pose pose
# Corresponding cost weights
float64[] pose_w
