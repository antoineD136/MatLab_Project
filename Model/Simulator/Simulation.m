clc;
disp('D�but simulation');
InitSimulator
i = 1;
j = 0;
while actualTime <= totalTime
    % LOG pour conna�tre le num�ro de la collision
    disp('COLLISION N�');
    disp(j + 1);
    % Rep�rage du c�t� vers lequel se dirige le cercle et calcul du temps
    % qu'il faut pour aller vers celui-ci
    [time, side] = getTargetSide(cercl, box );
    % Ajout de ce temps, au temps de simulation
    actualTime = actualTime + time;
    % V�rification du fait que le temps de simulation n'a pas d�pass� le
    % temps total
    if actualTime <= totalTime   
        % Affichage de la simulation
        ShowSimulation
        % Calcul du nouveau vecteur vitesse
        SetNewVVector
    end
    % Iteration pour les logs pour connaitre � combien de collision on est
    j = j + 1;
end
disp('Fin simulation');
