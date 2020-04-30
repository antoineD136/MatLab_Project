
cercl = cercle(4, 4, 2, 10, 0);
s1 = side(7,-10, 7, 10);
[xcInitial , ycInitial] = getCoord(cercl);
distance = getDistanceBetweenSideAndCircle(xcInitial, ycInitial, s1);
[vxc, vyc] = getVelocityComponents(getVelocityVector(cercl));
i=1;
[xMatrixs, yMatrixs] = getPointsMatrix(s1);
t = 0;
while 1
    xcf = xcInitial + vxc*t;
    theta = linspace(0, 2*pi);
    ycf = ycInitial + vyc*t;
    distance = getDistanceBetweenSideAndCircle(xcf,ycf, s1);
    if(distance < getRadius(cercl))
        break
    end
    x = getRadius(cercl)*cos(theta) + xcf;
    y = getRadius(cercl)*sin(theta) + ycf;
    plot(x,y, xMatrixs, yMatrixs ); 
    axis equal;
    xlim([-10,20]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;
    t = t+0.01;
end
