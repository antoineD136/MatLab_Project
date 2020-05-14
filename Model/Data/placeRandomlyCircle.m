function [replacedCircle] = placeRandomlyCircle(circle, box)
[extremumBoxX , extremumBoxY] = getExtremumCoord(box);
r = circle.radius;
xTMP = 0;
while ~verifyIfCircleIsInBox(circle, box)
    xInterval = [extremumBoxX(1,1) + r + xTMP , extremumBoxX(1,2) - r - xTMP];
    yInterval = [extremumBoxY(1,1) + r , extremumBoxY(1,2) - r];
    newX = xInterval(1,1) + (-xInterval(1,1) + xInterval(1,2))*rand(1);
    newY = yInterval(1,1) + (-yInterval(1,1) + yInterval(1,2))*rand(1);
    circle = cercle(newX, newY, r, circle.vVector.speed, circle.vVector.theta);
    xTMP = xTMP + 1;
end
replacedCircle = circle;
end

