i=1;
[xMatrixs, yMatrixs] = getPointsMatrix(s1);
for t=0:0.01:temps
    xcf = xc + vxc*t;
    theta = linspace(0, 2*pi);
    ycf = yc + vyc*t;
    x = 5*cos(theta) + xcf;
    y = 5*sin(theta) + ycf;
    plot(x,y, xMatrixs, yMatrixs ); 
    axis equal;
    xlim([0,10]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;
end