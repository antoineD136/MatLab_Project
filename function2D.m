function [temps] = function2D(c , distance)
temps = (distance - getRadius(c)) / abs(getSpeed(getVelocityVector(c)));
end
