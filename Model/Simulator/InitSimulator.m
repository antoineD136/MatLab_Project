disp('Début initSimulator');
totalTime = 1;
actualTime = 0;
boxLenght = 15; %Longueur de la boîte
boxHeight = 25; %Hauteur de la boîte
boxOrientation = 0; %Orientation de la boîte en degrés sens anti-horaire
x_Side_Initial = 0; %Position initial de la boîte en X
y_Side_Initial = 10; %Position initial de la boîte en Y
box = Box(x_Side_Initial, y_Side_Initial,boxHeight, boxLenght, boxOrientation);
cercl = cercle(5, 14, 2, -20, 0);
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
[xMatrixs1, yMatrixs1] = getXAndYMatrixOfSide(box, 1);
[xMatrixs2, yMatrixs2] = getXAndYMatrixOfSide(box, 2);
[xMatrixs3, yMatrixs3] = getXAndYMatrixOfSide(box, 3);
[xMatrixs4, yMatrixs4] = getXAndYMatrixOfSide(box, 4);
disp('Fin initSimulator');
