function [yMin, yMax] = getMinAndMaxOfInclinedBox(yMatrix)
yTMPA = yMatrix(1,1);
yTMPB = yMatrix(1,2);
if yTMPA >= yTMPB
    yMin = yTMPB;
    yMax = yTMPA;
else
    yMin = yTMPA;
    yMax = yTMPB;
end
end


