 clc;
clear all;
close all;
% Setting up robot Connections
myev3 = legoev3('USB');
motor1 = motor(myev3,'A');
 motor2 = motor(myev3,'B');
 motor3 = motor(myev3,'C');
 TouchDown = touchSensor(myev3,1);
 TouchUp = touchSensor(myev3,3);
 pressDown = readTouch(TouchDown);
 pressUp = readTouch(TouchUp);  

 % --------------------- Station  C to A ------------------------- %
% % Homing at station A
Homing_station_A(motor3,motor2,motor1,TouchUp,TouchDown)
%  
% %Pick station coordinates
x =10; y = 0; z =-70; 
% %calling pick functions
Pick(motor3,motor2,motor1,x,y,z)
 
%Place station coordinates
x =-10; y = 0; z =0; 
%calling place functions
Place(motor3,motor2,motor1,TouchUp,x,y,z)
%%
% --------------------- Station  A to B ------------------------- %
%Homing at station A
Homing_station_A(motor3,motor2,motor1,TouchUp,TouchDown)

%Pick station coordinates
x =-10; y = 0; z =0; 
%calling pick functions
Pick(motor3,motor2,motor1,x,y,z)

%Place station coordinates
x =0; y = 10; z =-70; 
%calling place functions
Place(motor3,motor2,motor1,TouchUp,x,y,z)
%%
%------------------  Station  B to C  ----------------------------%
% Pick station coordinates
x =0; y = 10; z =-70; 
%calling pick functions
Pick(motor3,motor2,motor1,x,y,z)
%Place station coordinates
x =10; y = 0; z =-70; 
%calling place functions
Place(motor3,motor2,motor1,TouchUp,x,y,z)
Homing_station_A(motor3,motor2,motor1,TouchUp,TouchDown)

disp("Finished")