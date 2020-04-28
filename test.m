function [temps] = test(rayon, positionCentre, positionCote, vitesse)
T_1 = positionCote - positionCentre ./ vitesse;
f = @positionCentre + rayon - positionCote + vitesse.*x;
temps = fzero(@f, T_1);
end

