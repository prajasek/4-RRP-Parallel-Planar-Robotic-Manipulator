# 4RRP-Parallel-Robotic-Manipulator
Graphical User Interface for a 4-RRP planar parallel robotic manipulator.

----------------------------------------------------------------------
NOTE : mmr_project.m contains the code.
----------------------------------------------------------------------


List of operations on GUI

Reset/set: Reset button will bring back the guide to its default value. 

a) Inverse Kinematics: Set the values of Xe, Ye and Phie values using the sliders given in Inverse Kinematics panel and then click on display to calculate the values of theta1, theta2, theta3 and theta4.

b) Forward Kinematics: Set the values of theta1, theta2 and theta3 values using the sliders given in Forward Kinematics panel and then click on display to calculate the values Xe, Ye and Phie.

c) Maximal workspace: On clicking on the maximal workspace button on the GUI, Matlab starts to calculate the locations which comes under maximal wokspace. (the location which can be reached by End effector with atleast one orientation)

d) Constant orientation workspace: First select the value of orientation using the slider and then click on constant orientation button which will enable the matlab to start calculating the locations which come under constant orientation workspace.(The locations which can be reached by the end effector for the specified orientation)

e) Path tracking: First select the speed with which the end effector should move along the path and the values of Xe, Ye and Phe from inverse kinematics panel which represents the point at which the enffector starts tracing the path. Then select either of Ellipse, Circle or Square to make the end effector move along the respective path.

f)End effector length: end effector can be changed using the slider end effector.

g) Arm length: The link 1 lengths of all the arms can be changed using arm length slider.

h) Path: The path followed by the end effector in completing the task can be viewed by selecting the checkbox show reach.

i) Cursor selection: The cursor button allows the user to select a point on the axis to which the end effector moves.

j) Rotate: The rotate button depicts the complete movement possible for the manipulator for the given link 1 length.
