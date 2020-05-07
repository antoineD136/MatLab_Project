function [m,p] = getMandPFromVelocity(coord, speedInAxis)
x2 = coord(1,1) + speedInAxis(1,1);
y2 = coord(1,2) + speedInAxis(1,2);
if (x2 - coord(1,1)) ~= 0 
    m = (y2 -coord(1,2)) / (x2 - coord(1,1));
else
    disp('pente nulle');
    m = NaN;
end
p = coord(1,2) - m*coord(1,1);
end

