[theta, relativeTheta] = getThetaAndRelativeTheta(cercl.vVector);
cercl = cercle(xcf, ycf, cercl.radius, -cercl.vVector.speed, -toDegrees('radians', (2*relativeTheta - theta)));
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
[theta, relativeTheta] = getThetaAndRelativeTheta(cercl.vVector);
cercl = cercle(xcf, ycf, cercl.radius, -cercl.vVector.speed, -toDegrees('radians', (2*relativeTheta - theta)));
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