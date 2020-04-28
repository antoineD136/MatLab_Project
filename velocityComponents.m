function [vx, vy] = velocityComponentsm(vitesse, alpha)
vx = vitesse*cos(toRadians('degrees', alpha));
vy = vitesse*sin(toRadians('degrees', alpha));
end

