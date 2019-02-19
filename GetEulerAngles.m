

function [rx ry rz]= GetEulerAngles(R)



rx=atan2(R(3,2),R(3,3));
ry=atan2(-R(3,1),sqrt(R(3,2)^2+R(3,3)^2));
rz=atan2(R(2,1),R(1,1));
