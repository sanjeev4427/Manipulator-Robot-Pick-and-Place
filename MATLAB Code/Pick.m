function[]=Pick(motor3Obj,motor2Obj,motor1Obj,x,y,z)
% calling inverse kinematic function
[~, theta3, M, Mi]=Inversekinematics(x,y,z);

% Base motor control loop
start(motor3Obj)
% Base motor control 
% rotation direction of base motor
if abs(rad2deg(theta3))>=abs((readRotation(motor3Obj))/3)
    sign = -1;  %anticlockwise
else
    sign = 1;   %clockwise
end

% The loop will keep running until the desired angle is reached
while 1
    motor3Obj.Speed=30*sign;
    % when the desired angle is reached, the following conditions becomes
    % true and the loop is broken
    if  sign*double(abs(readRotation(motor3Obj))/3)<=sign*abs(rad2deg(theta3))
       break;
    end
end

% After reaching the desired position, we set the base motor speed to zero
motor3Obj.Speed = 0;
% We give a pause of half a second after reaching the desired position
pause(0.5)

% Elbow motor control loop
% The loop will keep running until the desired angle is reached
while 1
    motor2Obj.Speed=10;
    % when the desired angle is reached, the following conditions becomes
    % true and the loop is broken
    if  double(readRotation(motor2Obj)/5)>=rad2deg(Mi)-rad2deg(M) 
       break;
    end
end
% After reaching the desired position, we set the arm motor speed to zero   
motor2Obj.Speed = 0;
% We give a pause of half a second after reaching the desired position
pause(0.5)

% Closing the gripper
motor1Obj.Speed=30;  % Giving gripper motor a speed
start(motor1Obj);    % Starting the motor
pause(0.20)          % Waiting for the gripper to reach the closed position
stop(motor1Obj);     % stopping the gripper motor after reaching des. pos.

pause(0.5)

% To go to the upper position 
while 1
    motor2Obj.Speed=-30;
    % when the desired angle is reached, the following conditions becomes
    % true and the loop is broken
    if  double(readRotation(motor2Obj)/5)<=18
       break;
    end
end
% After reaching the desired position, we set the arm motor speed to zero   
motor2Obj.Speed = 0;

pause(0.5)
end