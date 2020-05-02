
cercl = cercle(2, 5, 2, 20, 20);
s1 = side(-10,8, 10, 7);
[xcInitial , ycInitial] = getCoord(cercl);
time = getFirstCollide(cercl, s1);
[vxc, vyc] = getVelocityComponents(getVelocityVector(cercl));
i=1;
[xMatrixs, yMatrixs] = getPointsMatrix(s1);
for t=0:0.01:time
    xcf = xcInitial + vxc*t;
    theta = linspace(0, 2*pi);
    ycf = ycInitial + vyc*t;
    x = getRadius(cercl)*cos(theta) + xcf;
    y = getRadius(cercl)*sin(theta) + ycf;
    plot(x,y, xMatrixs, yMatrixs ); 
    axis equal;
    xlim([-10,20]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;
end
