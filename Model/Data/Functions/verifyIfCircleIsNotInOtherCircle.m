function [isNotInCircle] = verifyIfCircleIsNotInOtherCircle(circle1, circle2)
    isNotInCircle = true;
    [squareCoordCircle1X , squareCoordCircle1Y] = getCircleSquareBox(circle1);
    [squareCoordCircle2X , squareCoordCircle2Y] = getCircleSquareBox(circle2);
    for i = 1:1:2
        for j = 1:2:3
            if (squareCoordCircle1Y(1,j) >= squareCoordCircle2Y(1,1) && squareCoordCircle1Y(1,j) <= squareCoordCircle2Y(1,3)) && (squareCoordCircle1X(1,i) >= squareCoordCircle2X(1,1) && squareCoordCircle1X(1,i) <= squareCoordCircle2X(1,2))
                isNotInCircle = false;
            end
        end  
    end
end

