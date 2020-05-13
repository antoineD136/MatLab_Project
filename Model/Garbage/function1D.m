function [temps] = function1D(rayon, positionCentre, positionCote, vitesse, T_1)
f = @(x) (positionCentre - rayon - positionCote) + (vitesse*x);
temps = fzero(f, T_1);
end

