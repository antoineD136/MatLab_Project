
cercl = cercle(8, 5, 2, -20, 20);
s1 = side(1,-10, 3, 10);
s2 = side(12, -10, 12, 10);
[xcInitial , ycInitial] = getCoord(cercl);
[time, cercl] = getFirstCollide(cercl, s1)
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
setNewVelocityVector