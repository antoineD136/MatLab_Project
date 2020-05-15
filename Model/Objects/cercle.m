classdef cercle
    %CIRCLE Summary of this class goes here
    %   Detailed explanation goes here
    properties
      radius;
      xCentre;
      yCentre;
      actualX;
      actualY;
      vVector;
      masse;
    end
    
    methods
        function obj = cercle(xCentre, yCentre, radius, speed, theta, masse)
            %CIRCLE Construct an instance of this class
            %   Detailed explanation goes here
            if theta == 360
                theta = 0;
             end
            obj.radius = radius;
            obj.masse = masse;
            obj.xCentre = xCentre;
            obj.yCentre = yCentre;
            obj.vVector = velocityVector(speed, theta, [obj.xCentre, obj.yCentre]);
        end
        
        function obj = modifyCircle(obj , xCentre, yCentre, veloVector)
            disp('UPDATE du cercle');
           obj.xCentre = xCentre;
           obj.yCentre = yCentre;
           newTheta = rad2deg(atan(veloVector(2 , 1) / veloVector(1 , 1)));
           newSpeed = norm(veloVector);
           obj.vVector = modifyVelocityVector(obj.vVector, newSpeed, newTheta, veloVector, [xCentre yCentre]);
        end
        %%SETTER
        function obj = set.radius(obj, radius)
            if radius == 0
                disp('Le rayon ne peut pas valoir zero!');
            else
            obj.radius = radius;
            end
        end
        function obj = set.masse(obj, masse)
            obj.masse = masse;
        end
        function obj = set.xCentre(obj, xCentre)
            obj.xCentre = xCentre;
        end
        function obj = set.actualX(obj, actualX)
            obj.actualX = actualX;
        end
         function obj = set.actualY(obj, actualY)
            obj.actualY = actualY;
        end
        function obj = set.yCentre(obj, yCentre)
            obj.yCentre = yCentre;
        end
        function obj = set.vVector(obj, vVector)
            obj.vVector = vVector;
        end
        %%GETTER
        function [circleSquareBoxX , circleSquareBoxY] = getCircleSquareBox(obj)
            xC = obj.xCentre;
            yC = obj.yCentre;
            r = obj.radius;
          circleSquareBoxX = [xC - r , xC + r , xC + r , xC - r];
          circleSquareBoxY = [yC - r ,  yC - r , yC + r , yC + r];
        end
        function masse = get.masse(obj)
            masse = obj.masse;
        end
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
        function actualX = get.actualX(obj)
            actualX = obj.actualX;
        end
        function yCentre = get.yCentre(obj)
            yCentre = obj.yCentre;
        end
        function actualY = get.actualY(obj)
            actualY = obj.actualY;
        end
    end
end

