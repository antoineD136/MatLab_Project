disp('Début initSimulator');
totalTime = 7; % Temps de simulation en seconde (ATTENTION le temps est relatif au programme et ne correspond pas au temps réel vécu)
actualTime = 0; 
boxLenght = 20; % Longueur de la boîte
boxHeight = 30; % Hauteur de la boîte
boxOrientation = 0; % Orientation de la boîte en degrés sens anti-horaire
x_Side_Initial = 0; % Position initial de la boîte en X
y_Side_Initial = 10; % Position initial de la boîte en Y
box = Box(x_Side_Initial, y_Side_Initial,boxHeight, boxLenght, boxOrientation); % Création de la boîte
cercl = cercle(50,20, 2, -20, 25); % Création du cercle
if ~verifyIfCircleIsInBox(cercl, box)
    disp('PROBLEME DE PLACEMENT DU CERCLE');
    cercl = placeRandomlyCircle(cercl, box);
end
% Initialisation des données utilisées pour le calcul et pour la
% visualisation de la simulation
[xcInitial , ycInitial] = getCoord(cercl);
[vxc, vyc] = getVelocityComponents(cercl.vVector);
[xMatrixs1, yMatrixs1] = getXAndYMatrixOfSide(box, 1);
[xMatrixs2, yMatrixs2] = getXAndYMatrixOfSide(box, 2);
[xMatrixs3, yMatrixs3] = getXAndYMatrixOfSide(box, 3);
[xMatrixs4, yMatrixs4] = getXAndYMatrixOfSide(box, 4);
disp('Fin initSimulator');
