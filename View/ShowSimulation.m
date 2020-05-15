k =0;
disp('Script simulation');
for t=0:0.01:time
    theta = linspace(0, 2*pi);
    
    xcf = xcInitial + vxc*t;
    ycf = ycInitial + vyc*t;
    x = cercl.radius*cos(theta) + xcf;
    y = cercl.radius*sin(theta) + ycf;
    cercl.actualX = xcf;
    cercl.actualY = ycf;
     
    xcf2 = xc2 + vxc2*t;
    ycf2 = yc2 + vyc2*t;
    x2 = cercl2.radius*cos(theta) + xcf2;
    y2 = cercl2.radius*sin(theta) + ycf2;
    cercl2.actualX = xcf2;
    cercl2.actualY = ycf2;
    
    plot(x,y,'g', x2, y2, 'm', xMatrixs1, yMatrixs1,'r', xMatrixs2, yMatrixs2,'r', xMatrixs3, yMatrixs3,'r', xMatrixs4, yMatrixs4, 'r' ); 
    axis equal;
    xlim([-30,30]);
    ylim([-50,50]);
    anim(i)=getframe;
    i=i+1;
    %Condition d'arrêt si distance < r1+r2
    distance = getDistanceBetweenCircle(xcf,ycf,xcf2,ycf2);
    if circleIntersect(cercl,cercl2,xcf,ycf,xcf2,ycf2) && k > 3
        isThereACirclesCollide = true;
        k = 0;
        break
    end
    k = k + 1;
end
circleMatrix = [cercl , cercl2];
disp('Fin script simulation');

