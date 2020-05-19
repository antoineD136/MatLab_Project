classdef cercle
    %CIRCLE Summary of this class goes here
    %   Detailed explanation goes here
    properties
        radius;
        xCentre;
        yCentre;
        finalX;
        finalY;
        vVector;
        mass;
        materials;
    end
    
    methods
        function obj = cercle(xCentre, yCentre, radius, speed, theta, materials)
            %CIRCLE Construct an instance of this class
            %   Detailed explanation goes here
            if theta == 360
                theta = 0;
            end
            obj.materials = materials;
            obj.radius = radius;
            obj.mass = getMass(obj,radius, materials);
            obj.xCentre = xCentre;
            obj.yCentre = yCentre;
            obj.vVector = velocityVector(speed, theta, [obj.xCentre, obj.yCentre]);
        end
        
        function obj = modifyCircle(obj , xCentre, yCentre, veloVector)
            disp('UPDATE du cercle');
            obj.xCentre = xCentre;
            obj.yCentre = yCentre;
            newTheta = rad2deg(atan(veloVector(2 , 1) / veloVector(1 , 1)))
            %newTheta = rad2deg(atan(veloVector(1 , 1) / veloVector(2 , 1)))
            newSpeed = norm(veloVector);
            obj.vVector = modifyVelocityVector(obj.vVector, newSpeed, newTheta, veloVector, [xCentre yCentre]);
            disp('FIN UPDATE DU CERCLE');
        end
        %%SETTER
        function obj = set.radius(obj, radius)
            if radius == 0
                disp('Le rayon ne peut pas valoir zero!');
            else
                obj.radius = radius;
            end
        end
        function obj = set.materials(obj, materials)
            obj.materials = materials;
        end
        function obj = set.mass(obj, masse)
            obj.mass = masse;
        end
        function obj = set.xCentre(obj, xCentre)
            obj.xCentre = xCentre;
        end
        function obj = set.finalX(obj, finalX)
            obj.finalX = finalX;
        end
        function obj = set.finalY(obj, finalY)
            obj.finalY = finalY;
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
        function materials = get.materials(obj)
            materials = obj.materials;
        end
        function mass = get.mass(obj)
            mass = obj.mass;
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
        function finalX = get.finalX(obj)
            finalX = obj.finalX;
        end
        function yCentre = get.yCentre(obj)
            yCentre = obj.yCentre;
        end
        function finalY = get.finalY(obj)
            finalY = obj.finalY;
        end
    end
    methods (Access = private)
        function mass = getMass(obj,radius, materials)
            rho = materials.rho / 1000;
            volume = (4*pi*(radius)^3) / 3;
            mass = rho * volume;
        end
    end
end

