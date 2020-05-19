function [angleInFirstQuadran] = getAngleInFirstQuadran(angle)
if angle > 90 && angle <= 180
    angle = angle - 90;
elseif angle > 180 && angle <= 270
    angle = angle - 180;
elseif angle > 270 && angle <= 360
    angle = angle - 270;
end
if angle == 90 
    angle = 89;
end
angleInFirstQuadran = angle;
end

