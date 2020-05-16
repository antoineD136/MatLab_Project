disp('Calcul du nouveau vecteur Vitesse (Script)');
if isThereACirclesCollide
    disp('Collisions des deux cercles');
    % Determiner les points d'intersection des cercles
    [ xIntercept1, xIntercept2, yIntercept1, yIntercept2 ] = getTangeanteLineOfCollide(circleMatrix(1, 1),circleMatrix(1, 2),circleMatrix(1, 1).finalX,circleMatrix(1, 1).finalY,circleMatrix(1, 2).finalX,circleMatrix(1, 2).finalY);
    % Nouveaux vecteurs vitesses
    [v1Prim,v2Prim] = getNewVelocityVectorFromCircleCollide(circleMatrix(1, 1),circleMatrix(1, 2),xIntercept1, xIntercept2, yIntercept1, yIntercept2 );
    %[v1Prim,v2Prim] = getNewVelocityVectorFromCircleCollide(circleMatrix(1, 1),circleMatrix(1, 2),circleMatrix(1, 1).finalX,circleMatrix(1, 1).finalY,circleMatrix(1, 2).finalX,circleMatrix(1, 2).finalY);
    circleMatrix(1, 1) = modifyCircle(circleMatrix(1, 1), circleMatrix(1, 1).finalX, circleMatrix(1, 1).finalY, v1Prim);
    circleMatrix(1, 2) = modifyCircle(circleMatrix(1, 2), circleMatrix(1, 2).finalX, circleMatrix(1, 2).finalY, v2Prim);
else
    if  abs(time1 - time2) <= precision
        vPrime = getNewVelocityVector(side1, circleMatrix(1, 1));
        vPrime2 = getNewVelocityVector(side2, circleMatrix(1, 2));
        circleMatrix(1, 1) = modifyCircle(circleMatrix(1, 1), circleMatrix(1, 1).finalX, circleMatrix(1, 1).finalY, vPrime);
        circleMatrix(1, 2) = modifyCircle(circleMatrix(1, 2), circleMatrix(1, 2).finalX, circleMatrix(1, 2).finalY, vPrime2);
    else
        vPrime = getNewVelocityVector(side, circleMatrix(1, numCircleThatGoingToCollide));
        circleMatrix(1, numCircleThatGoingToCollide) = modifyCircle(circleMatrix(1, numCircleThatGoingToCollide), circleMatrix(1, numCircleThatGoingToCollide).finalX, circleMatrix(1, numCircleThatGoingToCollide).finalY, vPrime);
        circleMatrix(1, numOtherCircle) = modifyCircle(circleMatrix(1, numOtherCircle), circleMatrix(1, numOtherCircle).finalX, circleMatrix(1, numOtherCircle).finalY, [circleMatrix(1, numOtherCircle).vVector.projectedSpeedVx ; circleMatrix(1, numOtherCircle).vVector.projectedSpeedVy]);
    end
end
actualTime = actualTime + time;
cercl = circleMatrix(1, 1);
cercl2 = circleMatrix(1, 2);
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
[xcInitial2,ycInitial2] = getCoord(cercl2);
[vxc2,vyc2] = getVelocityComponents(cercl2.vVector);
isThereACirclesCollide = false;
disp('Fin calcul du nouveau vecteur Vitesse (Script)');
