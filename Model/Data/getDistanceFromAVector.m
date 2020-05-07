function [distanceMatrix] = getDistanceFromAVector(box, circle)
[xIMatrix, yIMatrix] = getInterceptPoints(box, circle);
xc = circle.xCentre;
yc = circle.yCentre;
xVectorMatrix = xIMatrix - xc;
yVectorMatrix = yIMatrix - yc;
distanceMatrix = sqrt(xVectorMatrix.^2 + yVectorMatrix.^2);
[rows, colunms] = size(box.sideMatrix);
    for i = 1:1:colunms
        if xVectorMatrix(1,i) < 0 || yVectorMatrix(1,i) < 0
            distanceMatrix(1,i) = - distanceMatrix(1,i);
        end
    end
end

