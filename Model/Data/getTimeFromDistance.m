function [time] = getTimeFromDistance(distance, vitesse)
time = distance / abs(vitesse);
end

