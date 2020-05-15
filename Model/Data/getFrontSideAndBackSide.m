function [distanceMatrixToReturn] = getFrontSideAndBackSide(circle, box, distanceMatrix)
%disp("Distance Matrix AVANT : " + distanceMatrix);
[xIMatrix, yIMatrix] = getInterceptPoints(box, circle);
x1 = circle.xCentre + circle.vVector.projectedSpeedVx * 0.1;
x2 = circle.xCentre + circle.vVector.projectedSpeedVx * 0.2;
y1 = circle.yCentre + circle.vVector.projectedSpeedVy * 0.1;
y2 = circle.yCentre + circle.vVector.projectedSpeedVy * 0.2;
[rows, colunms] = size(box.sideMatrix);
    for i = 1:1:colunms
        distance1 = sqrt((xIMatrix(1,i) - x1)^2 + (yIMatrix(1,i) - y1)^2);
        distance2 = sqrt((xIMatrix(1,i) - x2)^2 + (yIMatrix(1,i) - y2)^2);
        %if~isnan(distanceMatrix(1,i))
        if  distanceMatrix(1,i) ~= Inf
            if distance1/distance2 < 1 
                distanceMatrix(1,i) = -distanceMatrix(1,i);
            elseif distance1/distance2 == 1
                distanceMatrix(1,i) = Inf;
            else
                distanceMatrix(1,i) = abs(distanceMatrix(1,i));
            end
        end
    end
    %disp("Distance Matrix APRES : " + distanceMatrix);
    distanceMatrixToReturn = distanceMatrix;  
end

