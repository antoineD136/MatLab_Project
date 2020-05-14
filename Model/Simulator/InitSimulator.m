disp('D�but initSimulator');
totalTime = 7; % Temps de simulation en seconde (ATTENTION le temps est relatif au programme et ne correspond pas au temps r�el v�cu)
actualTime = 0; 
boxLenght = 20; % Longueur de la bo�te
boxHeight = 30; % Hauteur de la bo�te
boxOrientation = 0; % Orientation de la bo�te en degr�s sens anti-horaire
x_Side_Initial = 0; % Position initial de la bo�te en X
y_Side_Initial = 10; % Position initial de la bo�te en Y
box = Box(x_Side_Initial, y_Side_Initial,boxHeight, boxLenght, boxOrientation); % Cr�ation de la bo�te
cercl = cercle(50,20, 2, -20, 25); % Cr�ation du cercle
if ~verifyIfCircleIsInBox(cercl, box)
    disp('PROBLEME DE PLACEMENT DU CERCLE');
    cercl = placeRandomlyCircle(cercl, box);
end
% Initialisation des donn�es utilis�es pour le calcul et pour la
% visualisation de la simulation
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
[xMatrixs1, yMatrixs1] = getXAndYMatrixOfSide(box, 1);
[xMatrixs2, yMatrixs2] = getXAndYMatrixOfSide(box, 2);
[xMatrixs3, yMatrixs3] = getXAndYMatrixOfSide(box, 3);
[xMatrixs4, yMatrixs4] = getXAndYMatrixOfSide(box, 4);
disp('Fin initSimulator');
