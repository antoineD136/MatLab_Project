function [speed1, speed2] = compareResults(circle1, circle2)
speedX = (circle1.mass * circle1.vVector.initialSpeed * cos(deg2rad(circle1.vVector.initialTheta)) + circle2.mass * circle2.vVector.initialSpeed * cos(deg2rad(circle2.vVector.initialTheta)) - circle2.mass * circle2.vVector.speed * cos(deg2rad(circle2.vVector.theta))) / circle1.mass;
speedY = (circle1.mass * circle1.vVector.initialSpeed * sin(deg2rad(circle1.vVector.initialTheta)) + circle2.mass * circle2.vVector.initialSpeed * sin(deg2rad(circle2.vVector.initialTheta)) - circle2.mass * circle2.vVector.speed * sin(deg2rad(circle2.vVector.theta))) / circle1.mass;
speedX2 = (circle2.mass * circle2.vVector.initialSpeed * cos(deg2rad(circle2.vVector.initialTheta)) + circle1.mass * circle1.vVector.initialSpeed * cos(deg2rad(circle1.vVector.initialTheta)) - circle1.mass * circle1.vVector.speed * cos(deg2rad(circle1.vVector.theta))) / circle2.mass;
speedY2 = (circle2.mass * circle2.vVector.initialSpeed * sin(deg2rad(circle2.vVector.initialTheta)) + circle1.mass * circle1.vVector.initialSpeed * sin(deg2rad(circle1.vVector.initialTheta)) - circle1.mass * circle1.vVector.speed * sin(deg2rad(circle1.vVector.theta))) / circle2.mass;
speed1 = norm([speedX ; speedY]);
speed2 = norm([speedX2 ; speedY2]);
end

