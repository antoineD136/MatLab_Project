function [time, circle] = getFirstCollide(circle1, side1)
[xCircle1, yCircle1] = getCoord(circle1);
distanceToRunC1S1 = getDistanceBetweenSideAndCircle(xCircle1, yCircle1, side1);
distanceC1S1 = getDistanceFromAVector(side1, circle1);
speed = applySpeedToNewAxis(getSpeed(getVelocityVector(circle1)), (pi/2)-getAnglefromSinus(distanceToRunC1S1, distanceC1S1));
time = getTimeFromDistance(distanceToRunC1S1 - getRadius(circle1), speed);
end

