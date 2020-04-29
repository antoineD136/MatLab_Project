i=1;
cercle = circle(10, 5, 2, -2, 0);
s1 = side(0, -10, 0, 10);
distance = getDistanceFromAVector(s1 ,cercle);
temps = function2D(cercle, distance);
%%[xTest, yTest] = showVelocityVector(vx, vy, positionCentre);
%%collide(xc1,yc1,xTest, yTest);
[xc , yc] = getCoord(cercle);
[vxc, vyc] = getVelocityComponents(getVelocityVector(cercle));
for t=0:0.1:temps
    xcf = xc + vxc*t;
    theta = linspace(0, 2*pi);
    ycf = yc + vyc*t;
    x = 2*cos(theta) + xcf;
    y = 2*sin(theta) + ycf;
    plot(x,y ); 
    axis equal;
    xlim([0,10]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;
end