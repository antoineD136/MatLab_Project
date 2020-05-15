function [vPrime] = getNewVelocityVector(side, circle) % Fonction pour définir le nouveau vecteur vitesse du cercle effectuant la collision
% Récupération de la pente de la droite et de son ordonnée à l'origine
[m, p] = getSlopeAndP(side);
% Calcul du nouveau vecteur vitesse V'
% Si la droite est verticale
if isnan(m)
    disp('coté verticale');
    vPrime = [-circle.vVector.projectedSpeedVx ; circle.vVector.projectedSpeedVy];
% Si la droite est horizontale
elseif m == 0
    disp('Côté horizontal');
    vPrime = [circle.vVector.projectedSpeedVx ; -circle.vVector.projectedSpeedVy];
% Si la droite est oblique.
% REMARQUE : la définition des composantes y ne se fait qu'à partir d'ici
% pour une raison d'optimisation
else
    disp('Côté oblique');
    V = [circle.vVector.projectedSpeedVx circle.vVector.projectedSpeedVy];
    % Calcul donnée
    % Définition des composantes X des deux points appartenant à la droite sur 
    % laquelle s'effectue la collision
    xTest1 = 2; 
    xTest2 = xTest1 + 1;
    yTest1 = m .* xTest1 + p;
    yTest2 = m .* xTest2 + p;
    xNumber = xTest2 - xTest1;
    % r parallèle
    rPara = [xNumber ; yTest2 - yTest1];
    % r perpendiculaire
    rPerpen = [yTest1 - yTest2 ; xNumber];
    % Composantes U
    % U Parallèle
    uPara = (1/norm(rPara)) * [xTest2 - xTest1 ; yTest2 - yTest1];
    % U Perpendiculaire
    uPerpen = (1/norm(rPerpen)) * [-1*(yTest2 - yTest1) ; xTest2 - xTest1];
    % Calcul des composantes de V'
    % Calcul de v' Parallèle
    vPara = V * uPara;
    % Calcul de v' perpendiculaire
    vPerpen = V * uPerpen;
    vPerpen = -vPerpen;
    % Calcul de V'
    vPrime = vPara*uPara + vPerpen*uPerpen
end
end

