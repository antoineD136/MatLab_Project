classdef velocityVector
    %VELOCITYVECTOR Summary of this class goes here
    %   Detailed explanation goes here
    properties
        projectedSpeedVx;
        projectedSpeedVy;
        slope;
        p;
        theta;
        speed;
        thetaAboutSideFromCollide;
    end
    
    methods
        function obj = velocityVector(speed, theta, coord)
            obj.speed = speed;
            obj.theta = theta;
            [obj.projectedSpeedVx,obj.projectedSpeedVy]  = velocityComponents(speed, theta);
            obj = setSlopeAndP(obj, coord);
        end
        function obj = modifyVelocityVector(obj, speed, theta, veloVector, coord)
            disp('UPDATE de velocityVector');
            obj.projectedSpeedVx = veloVector(1 , 1);
            obj.projectedSpeedVy = veloVector(2 , 1);
            obj.theta = theta;
            obj.speed = speed;
            obj = setSlopeAndP(obj, coord);
        end
        %SETTER
        function obj = setSlopeAndP(obj, coord)
            [obj.slope, obj.p] = getMandPFromVelocity(coord, [obj.projectedSpeedVx, obj.projectedSpeedVy]);
        end
        function obj = set.slope(obj, slope)
            obj.slope = slope;
        end
        function obj = set.p(obj, p)
            obj.p = p;
        end
        function obj = set.projectedSpeedVx(obj, projectedSpeedVx)
            obj.projectedSpeedVx = projectedSpeedVx;
        end
        function obj = set.projectedSpeedVy(obj, projectedSpeedVy)
            obj.projectedSpeedVy = projectedSpeedVy;
        end
        function obj = set.theta(obj, theta)
            obj.theta = theta;
        end
        function obj = set.speed(obj, speed)
            obj.speed = speed;
        end
        function obj = set.thetaAboutSideFromCollide(obj, thetaAboutSideFromCollide)
            obj.thetaAboutSideFromCollide = toDegrees('radians',thetaAboutSideFromCollide);
        end
        %%GETTER
        function projectedSpeedVx = get.projectedSpeedVx(obj)
            projectedSpeedVx = obj.projectedSpeedVx;
        end
        function projectedSpeedVy = get.projectedSpeedVy(obj)
            projectedSpeedVy = obj.projectedSpeedVy;
        end
        function slope = get.slope(obj)
            slope = obj.slope;
        end
        function p = get.p(obj)
            p = obj.p;
        end
        function theta = get.theta(obj)
            theta = obj.theta;
        end
        function speed = get.speed(obj)
            speed = obj.speed;
        end
        function thetaAboutSideFromCollide = get.thetaAboutSideFromCollide(obj)
            thetaAboutSideFromCollide = obj.thetaAboutSideFromCollide;
        end
        function [theta, thetaAboutSideFromCollide] = getThetaAndRelativeTheta(obj)
            theta = obj.theta;
            thetaAboutSideFromCollide = obj.thetaAboutSideFromCollide;
        end
        function [vx, vy] = getVelocityComponents(obj)
            vx = obj.projectedSpeedVx;
            vy = obj.projectedSpeedVy;
        end
    end
end

