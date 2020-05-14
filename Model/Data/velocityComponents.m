function [vx, vy] = velocityComponents(vitesse, alpha)
precision = 0.000001;
toRadians('degrees', alpha);
vx = vitesse*cos(toRadians('degrees', alpha));
if vx < 0 + precision && vx > 0 - precision
    vx = 0;
end
vy = vitesse*sin(toRadians('degrees', alpha));
if vy < 0 + precision && vy > 0 - precision
    vy = 0;
end
end

