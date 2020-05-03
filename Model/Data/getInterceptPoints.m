function [xI, yI] = getInterceptPoints(side, circle)
disp('mc et pc valent');
disp(num2str(getSlopeAndP(circle)));
[mc , pc] = getSlopeAndP(circle);
[ms , ps] = getSlopeAndP(side);
if(isnan(ms)) 
   xI = getX(side);
else
   xI = (pc - ps)/(ms - mc);
end
yI = mc*xI + pc;
end

