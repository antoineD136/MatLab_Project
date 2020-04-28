function [xco,yco] = createBoard(x1, y1, x2, y2)
x = linspace(x1 , x2, 1000);
if((x2 - x1) ~= 0)
m = (y2 - y1)/(x2 - x1);
p = y1 - m*x1;
y = m * x + p ;
else 
y = linspace(y1, y2, 1000);
end
xco = x
yco = y
end

