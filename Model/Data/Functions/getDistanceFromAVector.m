function [distanceMatrix] = getDistanceFromAVector(box, circle)
tolerance = 0.1;
[xIMatrix, yIMatrix] = getInterceptPoints(box, circle);
xc = circle.xCentre;
yc = circle.yCentre;
xVectorMatrix = xIMatrix - xc;
yVectorMatrix = yIMatrix - yc;
distanceMatrix = sqrt(xVectorMatrix.^2 + yVectorMatrix.^2);
[rows, colunms] = size(box.sideMatrix);
    for i = 1:1:colunms
        if (xIMatrix(1,i) > box.sideMatrix(1,2).xA + tolerance || xIMatrix(1,i) < box.sideMatrix(1,1).xA - tolerance) && isnan(box.sideMatrix(1,i).m)
            disp('C�t� ' + i + ' qui sort de la bo�te en x');
            distanceMatrix(1,i) = Inf;
        elseif (yIMatrix(1,i) > box.sideMatrix(1,3).yB + tolerance || yIMatrix(1,i) < box.sideMatrix(1,4).yA - tolerance) && box.sideMatrix(1,i).m == 0
            disp('C�t� ' + i + ' qui sort de la bo�te en y');
            distanceMatrix(1,i) = Inf;
        end
    end
end

