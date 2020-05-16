function [time, sideToCollide] = getTimeAndSideForCollide(timeMatrix, box)
%disp('timeMatrix');
time = Inf;
[rows, colunms] = size(box.sideMatrix);
    for i = 1:1:colunms
        timeTmp = timeMatrix(1, i);
        if isnan(timeTmp) || timeTmp == Inf || timeTmp == -Inf
            continue
        end
        if timeTmp < time && timeTmp >= 0 
            time = timeTmp;
        end
    end
    [row, col] = find(timeMatrix == time);
   sideToCollide = box.sideMatrix(row, col);
end

