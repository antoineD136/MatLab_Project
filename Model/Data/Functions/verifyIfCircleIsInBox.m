function [isInBox] = verifyIfCircleIsInBox(circle, box)
isInBox = true;
[circleSquareBoxX , circleSquareBoxY] = getCircleSquareBox(circle)
[xExtremumMatrix, yExtremumMatrix] = getExtremumCoord(box)
sideMatrix = box.sideMatrix;
[~, colunms] = size(sideMatrix);
% Vérification suivant les x
for i = 1:1:colunms
    xMatrix = circleSquareBoxX(1,i);
    if xMatrix(1,1) >= xExtremumMatrix(1,2) || xMatrix(1,1) <= xExtremumMatrix(1,1)
        isInBox = false;
    end
end
if isInBox
    [mSideMatrix pSideMatrix] = getSlopeAndPMatrix(box);
    if isnan(mSideMatrix(1,1)) || mSideMatrix(1,1) == 0
        for i = 1:1:colunms
            if circleSquareBoxY(1,i) >= yExtremumMatrix(1,2) || circleSquareBoxY(1,i) <= yExtremumMatrix(1,1)
                isInBox = false;
            end
        end
    else
        %for i=1:1:1
        for i=1:1:4
            for j = 1:1:colunms
                yOnSideMatrix(1,j) = mSideMatrix(1,j)*circleSquareBoxX(1,i) + pSideMatrix(1,j)
            end
            %%On récupère les points y des côtés se trouvant au dessus ou en
            %%dessous de la sphère
            k = 1;
            for j = 1:1:colunms
                if yOnSideMatrix(1,j) > yExtremumMatrix(1,1) && yOnSideMatrix(1,j) < yExtremumMatrix(1,2)
                    yOnSideToCompareMatrix(1, k) =  yOnSideMatrix(1,j);
                    k = k +1 ;
                end
            end
            [yMin , yMax] = getMinAndMaxOfInclinedBox(yOnSideToCompareMatrix);
            if  circleSquareBoxY(1,i) <= yMin || circleSquareBoxY(1,i) >= yMax
                isInBox = false
            end
        end
    end
end
%     for i = 1:1:colunms
%         for j = 1:1:colunms
%             if isnan(mSideMatrix(1,i))
%                 yOnSideMatrix(1,i) = Inf;
%             elseif mSideMatrix(1,i) == 0
%                 yOnSideMatrix(1,i) = box.sideMatrix(1,i).yA;
%             else
%                 yOnSideMatrix(i,j) = mSideMatrix(1,i)*circleSquareBoxX(1,j) + pSideMatrix(1,i)
%             end
%         end
%     end
%     if isnan(mSideMatrix(1,i)) || mSideMatrix(1,i) == 0
%         for i = 1:1:colunms
%                 if circleSquareBoxY(1,i) >= yExtremumMatrix(1,2) || circleSquareBoxY(1,i) <= yExtremumMatrix(1,1)
%                     isInBox = false;
%                 end
%         end
%     else
%         for i = 1:1:colunms
%             for j = 1:1:colunms
%                 yOnSideMatrix(j,i) = mSideMatrix(1,j)*circleSquareBoxX(1,i) + pSideMatrix(1,j);
%                 getMinAndMaxOfInclinedBox(yOnSideMatrix, yExtremumMatrix);
%             end
%
%         end
%     end
