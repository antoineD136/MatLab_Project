function [time] = getTimeFromDistance(distance, speed)
for i=1:1:4
    if speed(1,i) > 0 || speed(1,i) < 0
        time(1,i) = distance(1,i)/speed(1,i);
    else
        time(1,i) = Inf;
    end

end

end

