classdef cercle
    %CIRCLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        radius
        xCentre
        yCentre
        vVector
    end
    
    methods
        function obj = cercle(xCentre, yCentre, radius, speed, theta)
            %CIRCLE Construct an instance of this class
            %   Detailed explanation goes here
            obj.radius = radius;
            obj.xCentre = xCentre;
            obj.yCentre = yCentre;
            obj.vVector = velocityVector(speed, theta);
            obj.vVector = setSlopeAndP(obj.vVector, obj.xCentre, obj.yCentre);
        end
        
        %%SETTER
        
        
        %%GETTER
        
        function [m , p] = getSlopeAndP(obj)
            [m , p] = getSlopeAndP(obj.vVector);
        end
        function [x, y] = getCoord(obj)
            x = obj.xCentre;
            y = obj.yCentre;
        end
        
        function radius = getRadius(obj)
            radius = obj.radius;
        end
        
        function velocityVect = getVelocityVector(obj)
            velocityVect = obj.vVector;
        end
    end
end

