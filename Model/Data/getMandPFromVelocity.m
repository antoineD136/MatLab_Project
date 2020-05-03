function [m,p] = getMandPFromVelocity(coord, speedInAxis)
%disp('MandP');
%disp(num2str(speedInAxis));
x2 = coord(1,1) + speedInAxis(1,1)*1;
y2 = coord(1,2) + speedInAxis(1,2)*1;
if((x2 - coord(1,1)) ~= 0 )
    m = (y2 -coord(1,2)) / (x2 - coord(1,1));
else
    m =0;
end
p = coord(1,2) - m*coord(1,1);
end

