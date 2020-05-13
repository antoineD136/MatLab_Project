disp('Calcul du nouveau vecteur Vitesse (Script)');
vPrime = getNewVelocityVector(side, cercl);
cercl = modifyCircle(cercl, xcf, ycf, vPrime);
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
disp('Fin calcul du nouveau vecteur Vitesse (Script)');
