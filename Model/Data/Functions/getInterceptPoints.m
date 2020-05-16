function [xI, yI] = getInterceptPoints(box, circle)
%disp('inter');
[mc , pc] = getSlopeAndP(circle);
[mMatrix , pMatrix] = getSlopeAndPMatrix(box);
[rows, colunms] = size(box.sideMatrix);
for i = 1:1:colunms
    if(isnan(mMatrix(1, i))) 
        if isnan(mc)
            xI(1, i) = NaN;
            yI(1, i) = NaN;
        else
            xI(1, i) = getX(box.sideMatrix(1, i));
            yI(1, i) = mc*xI(1,i) + pc;
        end
    else
        if isnan(mc)
           xI(1, i) = circle.xCentre;
           yI(1, i) = getY(box.sideMatrix(1,i));
        else
            if (mMatrix(1, i) - mc) == 0
                xI(1, i) = NaN;
                yI(1, i) = NaN;
            else
                xI(1, i) = (pc - pMatrix(1, i))/(mMatrix(1, i) - mc);
                yI(1, i) = mc*xI(1,i) + pc; 
            end 
        end  
    end
end
%disp(' Fin inter');
end

