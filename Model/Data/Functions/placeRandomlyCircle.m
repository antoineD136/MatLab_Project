function [replacedCircle] = placeRandomlyCircle(circleToReplace, otherCircle, box)
randomNum = 0;
[extremumBoxX , extremumBoxY] = getExtremumCoord(box);
isInCorrectPosition = false;
rToReplace = circleToReplace.radius;
xInterval = [extremumBoxX(1,1) + rToReplace , extremumBoxX(1,2) - rToReplace];
yInterval = [extremumBoxY(1,1) + rToReplace , extremumBoxY(1,2) - rToReplace];
[squareCoordCircle2X , squareCoordCircle2Y] = getCircleSquareBox(otherCircle)
newX = xInterval(1,1) + (-xInterval(1,1) + xInterval(1,2))*rand(1);
newY = yInterval(1,1) + (-yInterval(1,1) + yInterval(1,2))*rand(1);
circleToReplace = cercle(newX, newY, rToReplace, circleToReplace.vVector.speed, circleToReplace.vVector.theta, circleToReplace.materials);
while ~isInCorrectPosition
    if ~verifyIfCircleIsNotInOtherCircle(circleToReplace, otherCircle)
        isInCorrectPosition = false;
        if (squareCoordCircle2X(1,1) - extremumBoxX(1,1) > (2*rToReplace)) || (squareCoordCircle2Y(1,1) - extremumBoxY(1,1) > (2*rToReplace))
            xInterval = [extremumBoxX(1,1) + rToReplace , squareCoordCircle2X(1,1) - rToReplace];
            yInterval = [extremumBoxY(1,1) + rToReplace , squareCoordCircle2Y(1,1) - rToReplace];
        elseif (squareCoordCircle2X(1,1) - extremumBoxX(1,1) > (2*rToReplace)) ||   (extremumBoxY(1,2) - squareCoordCircle2Y(1,2) > (2*rToReplace))
            xInterval = [extremumBoxX(1,1) + rToReplace , squareCoordCircle2X(1,1) - rToReplace];
            yInterval = [squareCoordCircle2Y(1,2) + rToReplace , extremumBoxY(1,2) - rToReplace];
        elseif (extremumBoxX(1,2) - squareCoordCircle2X(1,2) > (2*rToReplace)) || (squareCoordCircle2Y(1,1) - extremumBoxY(1,1) > (2*rToReplace))
            xInterval = [squareCoordCircle2X(1,2) + rToReplace , extremumBoxX(1,2) - rToReplace];
            yInterval = [extremumBoxY(1,1) + rToReplace , squareCoordCircle2Y(1,1) - rToReplace];
        elseif (extremumBoxX(1,2) - squareCoordCircle2X(1,2) > (2*rToReplace)) || (extremumBoxY(1,2) - squareCoordCircle2Y(1,2) > (2*rToReplace))
            xInterval = [squareCoordCircle2X(1,2) + rToReplace , extremumBoxX(1,2) - rToReplace];
            yInterval = [squareCoordCircle2Y(1,2) + rToReplace , extremumBoxY(1,2) - rToReplace];
        end
        if mod(randomNum, 2) == 0
            newX = xInterval(1,1) + (-xInterval(1,1) + xInterval(1,2))*rand(1);
        else
            newY = yInterval(1,1) + (-yInterval(1,1) + yInterval(1,2))*rand(1);
        end
        randomNum = randomNum + 1;
        circleToReplace = cercle(newX, newY, rToReplace, circleToReplace.vVector.speed, circleToReplace.vVector.theta, circleToReplace.materials);
    else
        isInCorrectPosition = true;
    end
end
replacedCircle = circleToReplace;
end

