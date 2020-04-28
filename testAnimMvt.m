i=1;
rayon = 2;
positionCentre = [10, 5];
positionCote = [0,5];
vitesse = -2;
temps = function2D(rayon,positionCentre, positionCote, vitesse);
for t=0:0.1:temps
    xc = positionCentre(1,1) + vitesse*t;
    theta = linspace(0, 2*pi);
    yc = positionCentre(1,2) + vitesse*t;
    x = rayon*cos(theta) + xc;
    y = rayon*sin(theta) + yc;
    plot(x,y);
    axis equal;
    xlim([0,10]);
    ylim([-10,10]);
    anim(i)=getframe;
    i=i+1;

end