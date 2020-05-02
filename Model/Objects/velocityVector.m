classdef velocityVector
    %VELOCITYVECTOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        vx
        vy
        mv
        pv
        theta
        speed
    end
    
    methods
        function obj = velocityVector(speed, theta)
            %VELOCITYVECTOR Construct an instance of this class
            %   Detailed explanation goes here
            obj.speed = speed;
            obj.theta = theta;
            [obj.vx , obj.vy] = velocityComponents(speed, theta);
        end
        %SETTER
        function obj = setSlopeAndP(obj, x, y)
            [obj.mv, obj.pv] = getMandPFromVelocity(x,y, obj.vx, obj.vy);
        end
        
        %%GETTER
        
        function [m , p] = getSlopeAndP(obj)
            m = obj.mv;
            p = obj.pv;
        end
        function speed = getSpeed(obj)
            speed = abs(obj.speed);
        end
        function [vx, vy] = getVelocityComponents(obj)
            vx = obj.vx;
            vy = obj.vy;
        end
        function [vx] = getVX(obj)
            vx = obj.vx;
        end 
    end
end

