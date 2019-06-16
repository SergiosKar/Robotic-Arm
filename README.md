# Robotic-Arm

## The goal of the project was to study the behaviour of a 4-dof robotic arm

To simulate the robotic arm , we used Matlab with Corke's robotic toolbox. 

![4-dof](https://github.com/SergiosKar/Robotic-Arm/blob/master/images/4dof.PNG)

### Model the robotic arm
The first step was the modeling of the robot in the simulated environment and the definition of 
the necessary parameters ( links between motors, masses , inertias etc.)

![toolbox](https://github.com/SergiosKar/Robotic-Arm/blob/master/images/robotic_toolbox.PNG)

### Kinematics

After modeling the robot, we solved the forward kinematics by calculating the Denavit-Hartenberg paremeters

Link| θi | di | ai | αi
----|----|----|----|---
1 |θ1| 0| 0| -90°
2 |θ2 |0| 0 |90°
3 |θ3 |0| 0| 0
4 |0| d4| 0| 0

### Inverse Kinematics

By expressing the parameters of the robot as a function of the Cartesian coordinates we get the following equations:

![inv-kin](https://github.com/SergiosKar/Robotic-Arm/blob/master/images/inverse-kin.PNG)

