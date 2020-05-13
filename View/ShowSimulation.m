
disp('Script simulation');
for t=0:0.01:time
    xcf = xcInitial + vxc*t;
    theta = linspace(0, 2*pi);
    ycf = ycInitial + vyc*t;
    x = cercl.radius*cos(theta) + xcf;
    y = cercl.radius*sin(theta) + ycf;
    plot(x,y, xMatrixs1, yMatrixs1, xMatrixs2, yMatrixs2, xMatrixs3, yMatrixs3, xMatrixs4, yMatrixs4 ); 
    axis equal;
    xlim([-30,30]);
    ylim([-50,50]);
    anim(i)=getframe;
    i=i+1;
end
disp('Fin script simulation');

