
function[] = Homing_station_A(motor3Obj,motor2Obj,motor1Obj,TouchUpobj,TouchDownobj)

pressDown = readTouch(TouchDownobj);
pressUp = readTouch(TouchUpobj);
%to set elbow motor at home postion
motor2Obj.Speed = -30;
start(motor2Obj);

 while pressUp == 0
    pressUp = readTouch(TouchUpobj);
 end
 
motor2Obj.Speed = 0;
 
 % to set base motor at home postion
motor3Obj.Speed = 30;
start(motor3Obj);

 while pressDown == 0
     pressDown = readTouch(TouchDownobj);
 end
 
% stop(mymotor2);
 motor3Obj.Speed = 0;
 pressDown = 0;

%to reset rotation of motor 2&3
resetRotation(motor2Obj); 
resetRotation(motor3Obj); 
 
% to run the gripper motor 1 second to close it 
motor1Obj.Speed=30;
start(motor1Obj);
pause(1)
motor1Obj.Speed=0;

%to open the gripper if gripper is close at home postion
motor1Obj.Speed=-30;
start(motor1Obj);
pause(0.20)  % tunning time to open and close gripper
motor1Obj.Speed=0;
pause(1)
end