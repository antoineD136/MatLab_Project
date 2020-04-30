function [m,p] = getMandPFromVelocity(x1, y1, vx, vy)
x2 = x1 + vx*1;
y2 = y1 + vy*1;
if((x2 - x1) ~= 0 )
    m = (y2 -y1) / (x2 - x1);
else
    m =0;
end
p = y1 - m*x1;
end

