function thetaToReturn = getNewThetaAfterCollide(theta, relativeTheta)
    thetaTMP = 360 - (2*relativeTheta - theta);
    thetaToReturn = getInFirstQuadran(thetaTMP);
end

function angleToReturn = getInFirstQuadran(angle)
   %while angle > 90
    %    if angle > 90 && angle <= 180
     %      angle = angle - 90;
      %  elseif angle > 180 && angle <= 270
       %    angle = angle - 180;
        %elseif angle > 270
         %  angle = angle - 270;
        %end
   %end
   while angle < 0
       angle = 360 + angle;
   end
   angleToReturn = angle;
end