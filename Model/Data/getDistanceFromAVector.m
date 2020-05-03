function [distance] = getDistanceFromAVector(s, circle)
[xI, yI] = getInterceptPoints(s, circle);
xc = circle.xCentre;
yc = circle.yCentre;
xvector = xI - xc;
yvector = yI - yc;
distance = sqrt(xvector^2 + yvector^2);
end

