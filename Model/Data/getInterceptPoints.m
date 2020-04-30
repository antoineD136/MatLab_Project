function [xI, yI] = getInterceptPoints(side, circle)
[mc , pc] = getSlopeAndP(circle);
[ms , ps] = getSlopeAndP(side);
if(isnan(ms)) 
   xI = getX(s);
else
   xI = (pc - ps)/(ms - mc);
end
yI = mc*xI + pc;
end

