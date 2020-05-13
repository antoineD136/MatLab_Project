function [distanceMatrix] = getDistanceFromAVector(box, circle)
[xIMatrix, yIMatrix] = getInterceptPoints(box, circle);
xc = circle.xCentre;
yc = circle.yCentre;
xVectorMatrix = xIMatrix - xc;
yVectorMatrix = yIMatrix - yc;
distanceMatrix = sqrt(xVectorMatrix.^2 + yVectorMatrix.^2);
[rows, colunms] = size(box.sideMatrix);
    for i = 1:1:colunms
        if (xIMatrix(1,i) > box.sideMatrix(1,2).xA || xIMatrix(1,i) < box.sideMatrix(1,1).xA) && isnan(box.sideMatrix(1,i).m)
            disp('Côté plus qui sort de la boîte en x');
            distanceMatrix(1,i) = Inf;
        elseif (yIMatrix(1,i) > box.sideMatrix(1,3).yB || yIMatrix(1,i) < box.sideMatrix(1,4).yA) && box.sideMatrix(1,i).m == 0
            disp('Côté plus qui sort de la boîte en y');
            distanceMatrix(1,i) = Inf;
        end
    end
end

