disp('Script setNewVVector');
[theta, relativeTheta] = getThetaAndRelativeTheta(cercl.vVector);
if cercl.vVector.projectedSpeedVx > 0 || cercl.vVector.projectedSpeedVx == 0
    disp('changement du relatif');
   relativeTheta = 360 - relativeTheta; 
end
theta = getNewThetaAfterCollide(theta, relativeTheta);
cercl = cercle(xcf, ycf, cercl.radius, -cercl.vVector.speed, theta);
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
disp('Fin script setNewVVector');
