function [temps] = function2D(rayon, positionCentre, positionCote, vitesse)
deplacement = positionCote - positionCentre
distance = norm(deplacement)
temps = (distance - rayon) / abs(vitesse);
end
