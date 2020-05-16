function [vxApplied] = applySpeedToNewAxis(speed, angleBetweenVectorAndNewAxis)
    vxApplied = speed .* cos(angleBetweenVectorAndNewAxis);
end

