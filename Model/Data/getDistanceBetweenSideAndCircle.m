function [lengthMatrix] = getDistanceBetweenSideAndCircle(xcircle, ycircle,box)
[mSideMatrix, pSideMatrix] = getSlopeAndPMatrix(box);
   [rows, colunms] = size(box.sideMatrix);
for i=1:1:colunms
    if(isnan(mSideMatrix(1,i)))
        mdpMatrix(1,i) = 0;
    elseif(mSideMatrix(1,i) == 0)
        mdpMatrix(1,i) = NaN;
    else
        mdpMatrix(1,i) = -1/mSideMatrix(1,i);
    end
    if(~isnan(mdpMatrix(1,i)))
        pdpMatrix(1,i) = ycircle - xcircle*mdpMatrix(1,i);
    end

    if(isnan(mSideMatrix(1,i)))
        xI = box.sideMatrix(1,i).xA; 
        yI = mdpMatrix(1,i)*xI + pdpMatrix(1,i);
    else
        if(~isnan(mdpMatrix(1,i)))
            xI = (pSideMatrix(1,i) - pdpMatrix(1,i))./(mdpMatrix(1,i) - mSideMatrix(1,i));
            yI = mdpMatrix(1,i)*xI + pdpMatrix(1,i);
        else
            xI = xcircle;
            yI = getY(box.sideMatrix(1,i));
        end
    end
     lengthMatrix(1,i) = sqrt((xcircle-xI)^2 + (ycircle - yI)^2);
end
end
