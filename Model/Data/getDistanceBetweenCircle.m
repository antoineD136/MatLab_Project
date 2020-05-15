function [distance] = getDistanceBetweenCircle (xcf,ycf, xcf2,ycf2)

xvector = xcf - xcf2;
yvector = ycf - ycf2;

distance = sqrt(xvector^2 + yvector^2);
end