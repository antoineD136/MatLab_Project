clc;
disp('Début simulation');
InitSimulator
i = 1;
j = 0;
while actualTime <= totalTime
    % LOG pour connaître le numéro de la collision
    disp('COLLISION N°');
    disp(j + 1);
    % Repérage du côté vers lequel se dirige le cercle et calcul du temps
    % qu'il faut pour aller vers celui-ci
    [time, side] = getTargetSide(cercl, box );
    % Ajout de ce temps, au temps de simulation
    actualTime = actualTime + time;
    % Vérification du fait que le temps de simulation n'a pas dépassé le
    % temps total
    if actualTime <= totalTime   
        % Affichage de la simulation
        ShowSimulation
        % Calcul du nouveau vecteur vitesse
        SetNewVVector
    end
    % Iteration pour les logs pour connaitre à combien de collision on est
    j = j + 1;
end
disp('Fin simulation');
