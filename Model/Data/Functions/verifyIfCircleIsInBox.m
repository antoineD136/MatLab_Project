function [isInCircle] = verifyIfCircleIsInBox(circle, box)
isInCircle = true;
[circleSquareBoxX , circleSquareBoxY] = getCircleSquareBox(circle);
[xExtremumMatrix yExtremumMatrix] = getExtremumCoord(box);
[rows, colunms] = size(box.sideMatrix);
% Vérification suivant les x
for i = 1:1:colunms
    xMatrix = circleSquareBoxX(1,i);
    if xMatrix(1,1) >= xExtremumMatrix(1,2) || xMatrix(1,1) <= xExtremumMatrix(1,1)
        isInCircle = false;
    end
end
if isInCircle
    [mSideMatrix pSideMatrix] = getSlopeAndPMatrix(box);
    for i = 1:1:colunms
        if isnan(mSideMatrix(1,i))
            yOnSideMatrix(1,i) = Inf;
        elseif mSideMatrix(1,i) == 0
            yOnSideMatrix(1,i) = box.sideMatrix(1,i).yA;
        else
            yOnSideMatrix(1,i) = mSideMatrix(1,i)*circleSquareBoxX(1,i) + pSideMatrix(1,i)
        end
    end
    for i = 1:1:colunms
    if circleSquareBoxY(1,i) >= yExtremumMatrix(1,2) || circleSquareBoxY(1,i) <= yExtremumMatrix(1,1)
        isInCircle = false;
    end
end
end
end

