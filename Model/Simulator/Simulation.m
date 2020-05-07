disp('Début simulation');
InitSimulator
i = 1;
while actualTime <= totalTime
[time, side, cercl] = getFirstCollide(cercl, box);
ShowSimulation
actualTime = actualTime + time;
SetNewVVector
end
disp('Fin simulation');
