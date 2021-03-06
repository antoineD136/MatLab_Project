
disp('Script simulation');
hold off
for t=0:0.01:time
    theta = linspace(0, 2*pi);
    xcf = xcInitial + vxc*t;
    ycf = ycInitial + vyc*t;
    x = cercl.radius*cos(theta) + xcf;
    y = cercl.radius*sin(theta) + ycf;
    xcf2 = xcInitial2 + vxc2*t;
    ycf2 = ycInitial2 + vyc2*t;
    x2 = cercl2.radius*cos(theta) + xcf2;
    y2 = cercl2.radius*sin(theta) + ycf2;
    plot(x,y,'g', x2, y2, 'm', xMatrixs1, yMatrixs1,'r', xMatrixs2, yMatrixs2,'g', xMatrixs3, yMatrixs3,'b', xMatrixs4, yMatrixs4, 'm' );
    axis equal;
    anim(i)=getframe;
    i=i+1;
end
if isThereACirclesCollide
    hold on
    [nX,nY,tX,tY] = getCollideAxis(cercl, cercl2, [cercl2.finalX - cercl.finalX ; cercl2.finalY - cercl.finalY]);
    plot(nX, nY, 'm', tX, tY, 'm');
end
circleMatrix = [cercl , cercl2];
disp('Fin script simulation');

