function [xco,yco, mco, pco] = createBoard(x1, y1, x2, y2)
x = linspace(x1 , x2, 1000);
if((x2 - x1) ~= 0)
m = (y2 - y1)/(x2 - x1);
y = m * x + p ;
p = y1 - m*x1;
else 
y = linspace(y1, y2, 1000);
m =NaN;
p = NaN;
end
xco = x;
yco = y;
mco = m;
pco = p;
end

