clc;
clear;
disp('Début simulation');
InitSimulator
i = 1;
j = 0;
while j < 30
%while actualTime <= totalTime
    % LOG pour connaître le numéro de la collision
    disp('COLLISION N°');
    disp(j + 1);
    % Repérage du côté vers lequel se dirige le cercle et calcul du temps
    % qu'il faut pour aller vers celui-ci
    [time1, side1] = getTargetSide(cercl, box );
    [time2, side2] = getTargetSide(cercl2, box );
    time2
    time1
    if time1 > time2
       side = side2;
       time = time2;
       numCircleThatGoingToCollide = 2;
       numOtherCircle = 1;
    else
       side = side1;
       time = time1;
       numCircleThatGoingToCollide = 1;
       numOtherCircle = 2;
    end
    time
    % Ajout de ce temps, au temps de simulation
    actualTime = actualTime + time;
    % Affichage de la simulation
    ShowSimulation
    % Calcul du nouveau vecteur vitesse
    SetNewVVector
    % Vérification du fait que le temps de simulation n'a pas dépassé le
    % temps total
    if actualTime >= totalTime
        break;
    end
    % Iteration pour les logs pour connaitre à combien de collision on est
    j = j + 1;
end
disp('Fin simulation');
