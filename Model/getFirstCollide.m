function [time, circle] = getFirstCollide(circle1, side1)
[xCircle1, yCircle1] = getCoord(circle1);
distanceToRunC1S1 = getDistanceBetweenSideAndCircle(xCircle1, yCircle1, side1);
distanceC1S1 = getDistanceFromAVector(side1, circle1);
alpha = (pi/2)-getAnglefromSinus(distanceToRunC1S1, distanceC1S1)
circle1.vVector.thetaAboutSideFromCollide = alpha;
speed = applySpeedToNewAxis(circle1.vVector.speed, alpha);
time = getTimeFromDistance(distanceToRunC1S1 - circle1.radius, speed);
circle = circle1;
end

