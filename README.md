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

### Path Planning
To make the end-effector move in a circular path during a specific amount of time , we have to define at least 9 points
to form the path and then direct the arm into them with a specified order.

![inv-kin](https://github.com/SergiosKar/Robotic-Arm/blob/master/images/circle_path.PNG)

Of course before we actualy move the robot, we have to solve the robot's Dynamics.

### Dynamics

The formation of the Euler-Lagrange equation will enable us to find the actual forces we need to apply in the motors,
to force the arm move in a certain way.

![euler-lagr](https://github.com/SergiosKar/Robotic-Arm/blob/master/images/euler-lagrange.PNG)


### Control

Finally to optimize the movement of the robot into the specified path, it is essential to add a control mechanism.
We choosed ato do that using feedforward-torque control.


![control](https://github.com/SergiosKar/Robotic-Arm/blob/master/images/control.PNG)

After applying the control, we tried to move the robot in a circular path and  measured the difference between the desired path and the actual movement. 

![cpc](https://github.com/SergiosKar/Robotic-Arm/blob/master/images/circle_path_control%20.PNG)




