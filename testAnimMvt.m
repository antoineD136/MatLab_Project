i=1;
rayon = 2;
positionCentre = [10, 5];
positionCote = [2,0.5];
[vx, vy] = velocityComponents(-2, 20);
temps = function2D(rayon,positionCentre, positionCote, sqrt(vx^2 + vy^2));
[xc1, yc1] = createBoard(1, -10, 1, 10);
[xTest, yTest] = intercepts(vx, vy, positionCentre);
collide(xc1,yc1,xTest, yTest)
for t=0:0.1:temps
    xc = positionCentre(1,1) + vx*t;
    theta = linspace(0, 2*pi);
    yc = positionCentre(1,2) + vy*t;
    x = rayon*cos(theta) + xc;
    y = rayon*sin(theta) + yc;
    plot(x,y, xc1, yc1, tx1, ty1, xTest, yTest); 
    axis equal;
    xlim([0,10]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;
end