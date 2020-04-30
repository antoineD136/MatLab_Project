function [length] = getDistanceBetweenSideAndCircle(xcircle, ycircle,side)
[mside, pside] = getSlopeAndP(side);
if(isnan(mside))
    mdp = 0;
elseif(mside == 0)
    mdp = NaN;
else
    mdp = -1/mside;
end
if(~isnan(mdp))
    pdp = ycircle - xcircle*mdp;
end

if(isnan(mside))
    xI = getX(side); 
    yI = mdp*xI + pdp;
else
    if(~isnan(mdp))
        xI = (pside - pdp)/(mdp - mside);
        yI = mdp*xI + pdp;
    else
        xI = xcircle;
        yI = getY(side);
    end
end
    length = sqrt((xcircle-xI)^2 + (ycircle - yI)^2);
end
