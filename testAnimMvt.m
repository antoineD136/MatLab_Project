i=1;
rayon = 2;
positionCentre = [10, 5];
positionCote = [0,0.5];
[vx, vy] = velocityComponents(-2, 20);
temps = function2D(rayon,positionCentre, positionCote, sqrt(vx^2 + vy^2));
[xc1, yc1] = createBoard(4, 2, 8, 2);
for t=0:0.1:temps
    
    xc = positionCentre(1,1) + vx*t;
    theta = linspace(0, 2*pi);
    yc = positionCentre(1,2) + vy*t;
    x = rayon*cos(theta) + xc;
    y = rayon*sin(theta) + yc;
    plot(x,y, xc1, yc1); 
    axis equal;
    xlim([0,10]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;

end