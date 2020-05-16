function [v1Prim,v2Prim] = getNewVelocityVectorFromCircleCollide( circle1, circle2, xIntercept1, xIntercept2, yIntercept1, yIntercept2) % Fonction pour définir le nouveau vecteur vitesse du cercle effectuant la collision
yIntercept2;
yIntercept1;
xIntercept2;
xIntercept1;
%Vecteurs vitesses cercle1 et cercle2 
    V1 = [circle1.vVector.projectedSpeedVx circle1.vVector.projectedSpeedVy];
    V2 = [circle2.vVector.projectedSpeedVx circle2.vVector.projectedSpeedVy];
    % r parallèle
    rPara = [yIntercept2 - yIntercept1 ; -1*(xIntercept2 - xIntercept1)];
    % r perpendiculaire
    rPerpen = [xIntercept2 - xIntercept1 ; yIntercept2 - yIntercept1];
    % Composantes U
    % U Parallèle
    uPara = (1/norm(rPara)) * [xIntercept2 - xIntercept1 ; yIntercept2 - yIntercept1];
    % U Perpendiculaire
    uPerpen = (1/norm(rPerpen)) * [-1*(yIntercept2 - yIntercept1) ; xIntercept2 - xIntercept1];
    w1 = V1-V2;
    % Calcul des composantes de w'
    % Calcul de w Parallèle
    w1Para = w1 * uPara;
    % Calcul de w perpendiculaire
    w1Perpen = w1 * uPerpen;
    % Calcul des w' perpendiculaires
    w1PrimPerpen = w1Perpen*((circle1.mass - circle2.mass)/(circle1.mass + circle2.mass));
    w2PrimPerpen = w1Perpen*((2*circle1.mass)/(circle1.mass + circle2.mass));
    % Calcul des w'
    w1Prim = w1Para*uPara + w1PrimPerpen*uPerpen;
    w2Prim = w2PrimPerpen*uPerpen;
    % Réinitialisation V1 et V2 pour matrice 2X1
    V2 = [circle2.vVector.projectedSpeedVx; circle2.vVector.projectedSpeedVy];
    % V1' et V2'
    v1Prim = w1Prim + V2;
    v2Prim = w2Prim + V2;
end
