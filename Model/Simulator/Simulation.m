clc;
clear;
disp('Début simulation');
InitSimulator
i = 1;
j = 0;
while j < 1
    %while actualTime <= totalTime
    % LOG pour connaître le numéro de la collision
    disp('COLLISION N°');
    disp(j + 1);
    % Indication de la vitesse initiale de chaque cercle
    cercl.vVector.initialSpeed = cercl.vVector.speed;
    cercl2.vVector.initialSpeed = cercl2.vVector.speed;
    % Indication de la direction initiale du vecteur vitesse
    cercl.vVector.initialTheta = cercl.vVector.theta;
    cercl2.vVector.initialTheta = cercl2.vVector.theta;
    % Repérage du côté vers lequel se dirige le cercle et calcul du temps
    % qu'il faut pour aller vers celui-ci
    [time1, side1] = getTargetSide(cercl, box );
    [time2, side2] = getTargetSide(cercl2, box );
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
    %%%%%%%%%%%%
    circleCollideTime = 0;
    for t=0:0.00001:time
        xcf = xcInitial + vxc*t;
        ycf = ycInitial + vyc*t;
        xcf2 = xcInitial2 + vxc2*t;
        ycf2 = ycInitial2 + vyc2*t;
        %Condition d'arrêt si distance < r1+r2
        if circleIntersect(cercl,cercl2,xcf,ycf,xcf2,ycf2)
            circleCollideTime = t;
            break
        end
    end
    if circleCollideTime < time && circleCollideTime > 0
        isThereACirclesCollide = true;
        time =circleCollideTime;
    end
    cercl.finalX = xcInitial + vxc*time
    cercl.finalY = ycInitial + vyc*time
    cercl2.finalX = xcInitial2 + vxc2*time
    cercl2.finalY = ycInitial2 + vyc2*time
    [speed1 , speed2] = compareResults2(cercl, cercl2);
    % Ajout de ce temps, au temps de simulation
    % Affichage de la simulation
    ShowSimulation
    % Calcul du nouveau vecteur vitesse
    SetNewVVector
    % Vérification du fait que le temps de simulation n'a pas dépassé le
    % temps total
    if actualTime >= totalTime %|| collideTime > 0
        break;
    end
    % Iteration pour les logs pour connaitre à combien de collision on est
    j = j + 1;
end
speed1
speed2
cercl.vVector.speed
cercl2.vVector.speed

disp('Fin simulation');
