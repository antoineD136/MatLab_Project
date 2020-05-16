disp('D�but initSimulator');
timeToWait = 0;
numCircleThatGoingToCollide = 1;
numOtherCircle = 2;
isThereACirclesCollide = false;
precision = 0.03;
totalTime = 100; % Temps de simulation en seconde (ATTENTION le temps est relatif au programme et ne correspond pas au temps r�el v�cu)
actualTime = 0; 
startTime = 0;
boxLenght = 30; % Longueur de la bo�te
boxHeight = 30; % Hauteur de la bo�te
boxOrientation = 0; % Orientation de la bo�te en degr�s sens anti-horaire
x_Side_Initial = 0; % Position initial de la bo�te en X
y_Side_Initial = 0; % Position initial de la bo�te en Y
box = Box(x_Side_Initial, y_Side_Initial,boxHeight, boxLenght, boxOrientation); % Cr�ation de la bo�te
xlim([-5,35]);
ylim([-5,35]);
cercl = cercle(x_Side_Initial + 5, y_Side_Initial + 5, 2, 20, 45, Materials.WOOD); % Cr�ation du cercle
cercl2 = cercle(x_Side_Initial + 15, y_Side_Initial + 15, 2, -20, 20, Materials.WOOD);
if ~verifyIfCircleIsInBox(cercl, box) || ~verifyIfCircleIsNotInOtherCircle(cercl, cercl2)
    disp('PROBLEME DE PLACEMENT DU CERCLE');
    cercl = placeRandomlyCircle(cercl,cercl2, box);
end
if ~verifyIfCircleIsInBox(cercl2, box)
    disp('PROBLEME DE PLACEMENT DU CERCLE');
    cercl2 = placeRandomlyCircle(cercl2,cercl, box);
end
% Initialisation des donn�es utilis�es pour le calcul et pour la
% visualisation de la simulation
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
[xcInitial2,ycInitial2] = getCoord(cercl2);
[vxc2,vyc2] = getVelocityComponents(cercl2.vVector);
[xMatrixs1, yMatrixs1] = getXAndYMatrixOfSide(box, 1);
[xMatrixs2, yMatrixs2] = getXAndYMatrixOfSide(box, 2);
[xMatrixs3, yMatrixs3] = getXAndYMatrixOfSide(box, 3);
[xMatrixs4, yMatrixs4] = getXAndYMatrixOfSide(box, 4);
disp('Fin initSimulator');
