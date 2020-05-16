function [timeToWait] = getTimeToWaitBeforeAnotherCircleCollide(circle1, circle2)
theoryDistance = circle1.radius + circle2.radius + 0.002;
realDistance = getDistanceBetweenCircle(circle1.xCentre, circle1.yCentre, circle2.xCentre, circle2.yCentre);
time1 = abs((theoryDistance - realDistance) / circle1.vVector.speed);
time2 = abs((theoryDistance - realDistance) / circle1.vVector.speed);
if time1 >= time2
    timeToWait = time1;
else
    timeToWait = time2;
end
end

