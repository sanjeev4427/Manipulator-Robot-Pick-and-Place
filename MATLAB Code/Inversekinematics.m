function[theta2, theta3, M, Mi]=Inversekinematics(x,y,z)

% Defining Robotic Arm lengths
L1 = 50; L2 = 95; L3 = 185; L4 = 110;   


%Base Joint calculation
% Using inverse kinematic equations we calculate the target base 
% angle using the co-ordinates of the point we have to reach
    if (x<0 && y>=0)            %third quadrant
        theta3 = atan(y/x);
    elseif (x>=0 &&  y>=0)      %second quadrant
        theta3 = atan(y/x)-pi;
    end
 

% Elbow joint calculation
% Using inverse kinematic equations we calculate the target arm 
% angle using the co-ordinates of the point we have to reach
L1_ = sqrt((L1*L1) + (L2*L2) - 2*L1*L2*cos(3*pi/4));
alfa = (pi/2)- asin((L2*sin(3*pi/4))/L1_);
r = sqrt(L3*L3-(z+L4-L1_*sin(alfa))^2)-L1_*cos(alfa);
C =  atan(z/r);
L3_= sqrt((L1_*L1_) + (z*z) + (r*r)- 2*L1_*(sqrt(z*z + r*r))*cos(pi -( C + alfa)));
beta = acos(((L3*L3) +(L4*L4) - (L3_*L3_))/(2*L3*L4));
theta2 = (pi/2)-beta + alfa;
M = theta2 - (asin((L1*sin(3*pi/4))/L1_));
MInDegrees1 = rad2deg(M);
Mi=deg2rad(81);  % Initial elbow joint angle at homing position
end