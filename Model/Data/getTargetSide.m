function [time, side] = getTargetSide(circle, box )
disp('Début getTargetSide');
[xCircle1, yCircle1] = getCoord(circle);
distanceToRunMatrix = getDistanceBetweenSideAndCircle(xCircle1, yCircle1, box);
distanceSideCircleMatrix = getDistanceFromAVector(box, circle);
angleMatrix = (pi/2) - getAnglefromSinus(distanceToRunMatrix, distanceSideCircleMatrix);
speedMatrix = applySpeedToNewAxis(circle.vVector.speed, angleMatrix);
timeMatrix = getTimeFromDistance(distanceToRunMatrix - circle.radius - 0.0001, speedMatrix);
distanceSideCircleMatrix = getFrontSideAndBackSide(circle, box, distanceSideCircleMatrix);
[rows, colunms] = size(box.sideMatrix);
for i = 1:1:colunms
     if  distanceSideCircleMatrix(1,i) < 0 ||  distanceSideCircleMatrix(1,i) == Inf
           timeMatrix(1, i) = -timeMatrix(1, i);
     end
end
[time, side] = getTimeAndSideForCollide(timeMatrix, box);
disp('Fin getTargetSide');
end

