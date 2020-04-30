function [xI, yI] = getInterceptPoints(s, c)
[mc , pc] = getSlopeAndP(c);
[ms , ps] = getSlopeAndP(s);
if(isnan(ms)) 
   xI = getX(s);
else
   xI = (pc - ps)/(ms - mc);
end
yI = mc*xI + pc;
end

