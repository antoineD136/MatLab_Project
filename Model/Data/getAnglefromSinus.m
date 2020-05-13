function [angle] = getAnglefromSinus(oppositeSide, hypothenuse)
[rows, colunms] = size(hypothenuse);
for i=1:1:colunms
    if isnan(hypothenuse)
        angle(1,i) = pi/2;
    else
        angle(1,i) = asin(abs(oppositeSide(1,i)) / abs(hypothenuse(1,i)));
    end
end

