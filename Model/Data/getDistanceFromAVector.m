function [distance] = getDistanceFromAVector(s, cercle)
[xI, yI] = getInterceptPoints(s, cercle);
[xc, yc] = getCoord(cercle);
xvector = xI - xc;
yvector = yI - yc;
distance = sqrt(xvector^2 + yvector^2);
end

