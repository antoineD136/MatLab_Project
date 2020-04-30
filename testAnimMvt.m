
cercl = cercle(10, 5, 5, -20, 20);
s1 = side(5, -10, 1, 10);
distance = getDistanceFromAVector(s1 ,cercl);
temps = function2D(cercl, distance);
%%[xTest, yTest] = showVelocityVector(vx, vy, positionCentre);
%%collide(xc1,yc1,xTest, yTest);
[xc , yc] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(getVelocityVector(cercl));
showAnim;