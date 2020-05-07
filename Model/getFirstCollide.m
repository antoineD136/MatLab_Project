function [time, side, circleToReturn] = getFirstCollide(circle, box)
disp('Début getFirstCollide');
[xCircle1, yCircle1] = getCoord(circle);
distanceToRunMatrix = getDistanceBetweenSideAndCircle(xCircle1, yCircle1, box)
distanceSideCircleMatrix = getDistanceFromAVector(box, circle)
angleMatrix = (pi/2) - getAnglefromSinus(distanceToRunMatrix, distanceSideCircleMatrix);
speedMatrix = applySpeedToNewAxis(circle.vVector.speed, angleMatrix);
timeMatrix = getTimeFromDistance(distanceToRunMatrix - circle.radius, speedMatrix);
[rows, colunms] = size(box.sideMatrix);
for i = 1:1:colunms
     if distanceSideCircleMatrix(1,i) < 0
           timeMatrix(1, i) = -timeMatrix(1, i);
     end
end
[time, side] = getTimeAndSideForCollide(timeMatrix, box);
[row,col] = find(timeMatrix== time)
angleMatrix
circle.vVector.thetaAboutSideFromCollide = angleMatrix(row, col);
disp('Fin getFirstCollide');
circleToReturn = circle;
end

