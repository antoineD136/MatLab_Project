function [speed1, speed2] = compareResults2(circle1, circle2)
alpha1 = atan2(circle2.finalY - circle1.finalY,circle2.finalX - circle1.finalX);
beta1 = atan2(circle1.vVector.projectedSpeedVy,circle1.vVector.projectedSpeedVx);
phi1 = beta1 - alpha1;
u12 = circle1.vVector.initialSpeed * cos(phi1);
u11 = circle1.vVector.initialSpeed * sin(phi1);
alpha2 = atan2(circle1.finalY - circle2.finalY,circle1.finalX - circle2.finalX);
beta2 = atan2(circle2.vVector.projectedSpeedVy,circle2.vVector.projectedSpeedVx);
phi2 = beta2 - alpha2;
u21 = circle2.vVector.initialSpeed * cos(phi2);
u22 = circle2.vVector.initialSpeed * sin(phi2);
v12 = (1/(circle1.mass + circle2.mass)) * ((circle1.mass - circle2.mass) * u12 - ( 2 * circle2.mass * u21));
v21 = (1/(circle1.mass + circle2.mass)) * ((circle1.mass - circle2.mass) * u21 + ( 2 * circle1.mass * u12));
v1 = u11*[-sin(alpha1) ; cos(alpha1)] + v12*[cos(alpha1) ; sin(alpha1)];
v2 = u22*[-sin(alpha2) ; cos(alpha2)] - v21*[cos(alpha2) ; sin(alpha2)];
speed1 = norm(v1);
speed2 = norm(v2);
end

