function [xI, yI] = showVelocityVector(vx, vy, positionCentre)
x1 = positionCentre(1,1);
y1 = positionCentre(1,2);
x2 = x1 + vx*1;
y2 = y1 + vy*1;
x = linspace(-1000 , 1000, 1000);
if(vx ~= 0)
m = vy/vx;
p = y1 - m*x1;
y = m * x + p ;
else 
y = linspace(-1000, 1000, 1000);
end
xI = x
yI = y
end

