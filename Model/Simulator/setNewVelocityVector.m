[theta, relativeTheta] = getThetaAndRelativeTheta(cercl.vVector);
if cercl.vVector.projectedSpeedVx > 0
    disp('changement du relatif');
   relativeTheta = 360 - relativeTheta; 
end
theta = getNewThetaAfterCollide(theta, relativeTheta);
cercl = cercle(xcf, ycf, cercl.radius, -cercl.vVector.speed, theta);
[xcInitial , ycInitial] = getCoord(cercl);



%%
[theta, relativeTheta] = getThetaAndRelativeTheta(cercl.vVector);

theta = getNewThetaAfterCollide(theta, relativeTheta);
cercl = cercle(xcf, ycf, cercl.radius, -cercl.vVector.speed, theta);
[xcInitial , ycInitial] = getCoord(cercl);
[time, cercl] = getFirstCollide(cercl, s1);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
i=1;
[xMatrixs1, yMatrixs1] = getPointsMatrix(s1);
[xMatrixs2, yMatrixs2] = getPointsMatrix(s2);
for t=0:0.01:time
    xcf = xcInitial + vxc*t;
    theta = linspace(0, 2*pi);
    ycf = ycInitial + vyc*t;
    x = cercl.radius*cos(theta) + xcf;
    y = cercl.radius*sin(theta) + ycf;
    plot(x,y, xMatrixs1, yMatrixs1, xMatrixs2, yMatrixs2 ); 
    axis equal;
    xlim([-10,20]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;
end
%%
[theta, relativeTheta] = getThetaAndRelativeTheta(cercl.vVector);
if cercl.vVector.projectedSpeedVx > 0
    disp('changement du relatif');
   relativeTheta = 360 - relativeTheta; 
end
theta = getNewThetaAfterCollide(theta, relativeTheta);
cercl = cercle(xcf, ycf, cercl.radius, -cercl.vVector.speed, theta);
[xcInitial , ycInitial] = getCoord(cercl);
[time, cercl] = getFirstCollide(cercl, s2);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
i=1;
[xMatrixs1, yMatrixs1] = getPointsMatrix(s1);
[xMatrixs2, yMatrixs2] = getPointsMatrix(s2);
for t=0:0.01:time
    xcf = xcInitial + vxc*t;
    theta = linspace(0, 2*pi);
    ycf = ycInitial + vyc*t;
    x = cercl.radius*cos(theta) + xcf;
    y = cercl.radius*sin(theta) + ycf;
    plot(x,y, xMatrixs1, yMatrixs1, xMatrixs2, yMatrixs2 ); 
    axis equal;
    xlim([-10,20]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;
end
