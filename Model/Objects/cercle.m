classdef cercle
    %CIRCLE Summary of this class goes here
    %   Detailed explanation goes here
    properties
      radius;
      xCentre;
      yCentre;
      vVector;
    end
    
    methods
        function obj = cercle(xCentre, yCentre, radius, speed, theta)
            %CIRCLE Construct an instance of this class
            %   Detailed explanation goes here
            obj.radius = radius;
            obj.xCentre = xCentre;
            obj.yCentre = yCentre;
            obj.vVector = velocityVector(speed, theta, [obj.xCentre, obj.yCentre]);
        end
        
        %%SETTER
        function obj = set.radius(obj, radius)
            if radius == 0
                disp('Le rayon ne peut pas valoir zero!');
            else
            obj.radius = radius;
            end
        end
        function obj = set.xCentre(obj, xCentre)
            obj.xCentre = xCentre;
        end
        function obj = set.yCentre(obj, yCentre)
            obj.yCentre = yCentre;
        end
        function obj = set.vVector(obj, vVector)
            obj.vVector = vVector;
        end
        %%GETTER
        
        function [m, p] = getSlopeAndP(obj)
            m = obj.vVector.slope;
            p = obj.vVector.p;
        end
        function [x, y] = getCoord(obj)
            x = obj.xCentre;
            y = obj.yCentre;
        end
        function radius = get.radius(obj)
            radius = obj.radius;
        end
        function vVector = get.vVector(obj)
            vVector = obj.vVector;
        end
        function xCentre = get.xCentre(obj)
            xCentre = obj.xCentre;
        end
        function yCentre = get.yCentre(obj)
            yCentre = obj.yCentre;
        end
    end
end

