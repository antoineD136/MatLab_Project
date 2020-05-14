classdef Box
    %SIDEMATRIX Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        sideMatrix;
    end
    
    methods
        function obj = Box(x_Side_Initial, y_Side_Initial, boxHeight, boxLenght, boxOrientation)
            boxOrientationPrime = atan(boxHeight / boxLenght); %Angle 
            boxDiagonale = sqrt(boxLenght^2 + boxHeight^2); 
            side1 = side(x_Side_Initial,y_Side_Initial, x_Side_Initial + (boxHeight * sin((2*pi) - boxOrientation)), y_Side_Initial + (boxHeight * cos((2*pi) - boxOrientation)));
            side2 = side(x_Side_Initial + (boxLenght * cos(boxOrientation)), y_Side_Initial + (boxLenght * sin(boxOrientation)) , x_Side_Initial + (boxDiagonale * cos(boxOrientation + boxOrientationPrime)), y_Side_Initial + (boxDiagonale * sin(boxOrientation + boxOrientationPrime)));
            side3 = side(x_Side_Initial + (boxHeight * sin((2*pi) - boxOrientation)), y_Side_Initial + (boxHeight * cos((2*pi) -boxOrientation)), x_Side_Initial + (boxDiagonale * cos(boxOrientation + boxOrientationPrime)), y_Side_Initial + (boxDiagonale * sin(boxOrientation + boxOrientationPrime))); 
            side4 = side(x_Side_Initial,y_Side_Initial, x_Side_Initial + (boxLenght * cos(boxOrientation)), y_Side_Initial + (boxLenght * sin(boxOrientation)));

            obj.sideMatrix = [side1, side2, side3, side4];
        end
        %%FUNCTION
        function [slopeMatrix, pMatrix] = getSlopeAndPMatrix(obj)
            [rows, colunms] = size(obj.sideMatrix);
            for i=1:1:colunms
               [slopeMatrix(1,i), pMatrix(1,i)] = getSlopeAndP(obj.sideMatrix(1,i)); 
            end
        end
        function [xMatrixSide, yMatrixSide] = getXAndYMatrixOfSide(obj, numberSide)
           [xMatrixSide, yMatrixSide] = getPointsMatrix(obj.sideMatrix(1, numberSide)); 
        end
        % Fonction pour récupérer les extremums x et y
        function [xExtremumMatrix, yExtremumMatrix] = getExtremumCoord(obj)
           [rows, colunms] = size(obj.sideMatrix);
           xMax = obj.sideMatrix(1,1).xA;
           xMin = xMax;
           yMax = obj.sideMatrix(1,1).yA;
           yMin = yMax;
           % Recherche du plus grand et du plus petit X
            for i = 1:1:colunms
                xTMPA = obj.sideMatrix(1,i).xA;
                xTMPB = obj.sideMatrix(1,i).xB;
                 if xTMPA >= xTMPB
                     xMaxTMP = xTMPA;
                     xMinTMP = xTMPB;
                 else
                     xMaxTMP = xTMPB;
                     xMinTMP = xTMPA;
                 end
                 % Recherche du xMax
                 if xMaxTMP >= xMax
                     xMax = xMaxTMP;
                 end
                 % Recherche du xMin
                 if xMinTMP <= xMin
                     xMin = xMinTMP;
                 end
            end 
            % Recherche du plus grand et du plus petit Y
             for i = 1:1:colunms
                yTMPA = obj.sideMatrix(1,i).yA;
                yTMPB = obj.sideMatrix(1,i).yB;
                 if yTMPA >= yTMPB
                     yMaxTMP = yTMPA;
                     yMinTMP = yTMPB;
                 else
                     yMaxTMP = yTMPB;
                     yMinTMP = yTMPA;
                 end
                 % Recherche du yMax
                 if yMaxTMP >= yMax
                     yMax = yMaxTMP;
                 end
                 % Recherche du yMin
                 if yMinTMP <= yMin
                     yMin = yMinTMP;
                 end
             end
            xExtremumMatrix = [xMin, xMax];
            yExtremumMatrix = [yMin, yMax];
        end
        %%SETTER
        function obj = set.sideMatrix(obj, matrix)
            obj.sideMatrix = matrix;
        end
        %%GETTER
        function sideMatrix = get.sideMatrix(obj)
            sideMatrix = obj.sideMatrix;
        end
    end
end

