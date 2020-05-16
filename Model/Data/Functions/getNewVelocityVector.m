function [vPrime] = getNewVelocityVector(side, circle) % Fonction pour d�finir le nouveau vecteur vitesse du cercle effectuant la collision
% R�cup�ration de la pente de la droite et de son ordonn�e � l'origine
[m, p] = getSlopeAndP(side);
% Calcul du nouveau vecteur vitesse V'
% Si la droite est verticale
if isnan(m)
    disp('cot� verticale');
    vPrime = [-circle.vVector.projectedSpeedVx ; circle.vVector.projectedSpeedVy];
% Si la droite est horizontale
elseif m == 0
    disp('C�t� horizontal');
    vPrime = [circle.vVector.projectedSpeedVx ; -circle.vVector.projectedSpeedVy];
% Si la droite est oblique.
% REMARQUE : la d�finition des composantes y ne se fait qu'� partir d'ici
% pour une raison d'optimisation
else
    disp('C�t� oblique');
    V = [circle.vVector.projectedSpeedVx circle.vVector.projectedSpeedVy];
    % Calcul donn�e
    % D�finition des composantes X des deux points appartenant � la droite sur 
    % laquelle s'effectue la collision
    xTest1 = 2; 
    xTest2 = xTest1 + 1;
    yTest1 = m .* xTest1 + p;
    yTest2 = m .* xTest2 + p;
    xNumber = xTest2 - xTest1;
    % r parall�le
    rPara = [xNumber ; yTest2 - yTest1];
    % r perpendiculaire
    rPerpen = [yTest1 - yTest2 ; xNumber];
    % Composantes U
    % U Parall�le
    uPara = (1/norm(rPara)) * [xTest2 - xTest1 ; yTest2 - yTest1];
    % U Perpendiculaire
    uPerpen = (1/norm(rPerpen)) * [-1*(yTest2 - yTest1) ; xTest2 - xTest1];
    % Calcul des composantes de V'
    % Calcul de v' Parall�le
    vPara = V * uPara;
    % Calcul de v' perpendiculaire
    vPerpen = V * uPerpen;
    vPerpen = -vPerpen;
    % Calcul de V'
    vPrime = vPara*uPara + vPerpen*uPerpen
end
end

