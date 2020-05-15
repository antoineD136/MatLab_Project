disp('Calcul du nouveau vecteur Vitesse (Script)');
if isThereACirclesCollide
    % Determiner les points d'intersection des cercles
    [ xIntercept1, xIntercept2, yIntercept1, yIntercept2 ] = getTangeanteLineOfCollide(circleMatrix(1, 1),circleMatrix(1, 2),xcf,ycf,xcf2,ycf2);
    % Nouveaux vecteurs vitesses
    [v1Prim,v2Prim] = getNewVelocityVectorFromCircleCollide(circleMatrix(1, 1),circleMatrix(1, 2), xIntercept1, xIntercept2, yIntercept1, yIntercept2);
    circleMatrix(1, 1) = modifyCircle(circleMatrix(1, 1), circleMatrix(1, 1).actualX, circleMatrix(1, 1).actualY, v1Prim);
    circleMatrix(1, 2) = modifyCircle(circleMatrix(1, 2), circleMatrix(1, 2).actualX, circleMatrix(1, 2).actualY, v2Prim);
else
    if  abs(time1 - time2) <= precision
        vPrime = getNewVelocityVector(side1, circleMatrix(1, 1));
        vPrime2 = getNewVelocityVector(side2, circleMatrix(1, 2));
        circleMatrix(1, 1) = modifyCircle(circleMatrix(1, 1), circleMatrix(1, 1).actualX, circleMatrix(1, 1).actualY, vPrime);
        circleMatrix(1, 2) = modifyCircle(circleMatrix(1, 2), circleMatrix(1, 2).actualX, circleMatrix(1, 2).actualY, vPrime2);
    else
       vPrime = getNewVelocityVector(side, circleMatrix(1, numCircleThatGoingToCollide));
       circleMatrix(1, numCircleThatGoingToCollide) = modifyCircle(circleMatrix(1, numCircleThatGoingToCollide), circleMatrix(1, numCircleThatGoingToCollide).actualX, circleMatrix(1, numCircleThatGoingToCollide).actualY, vPrime);
       circleMatrix(1, numOtherCircle) = modifyCircle(circleMatrix(1, numOtherCircle), circleMatrix(1, numOtherCircle).actualX, circleMatrix(1, numOtherCircle).actualY, [circleMatrix(1, numOtherCircle).vVector.projectedSpeedVx ; circleMatrix(1, numOtherCircle).vVector.projectedSpeedVy]);
    end
end
cercl = circleMatrix(1, 1);
cercl2 = circleMatrix(1, 2);
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
[xc2,yc2] = getCoord(cercl2);
[vxc2,vyc2] = getVelocityComponents(cercl2.vVector);
isThereACirclesCollide = false;
disp('Fin calcul du nouveau vecteur Vitesse (Script)');
