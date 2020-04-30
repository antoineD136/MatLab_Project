classdef side
    %SIDE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       xA
       yA
       xB
       yB
        m
        p
        xMatrix
        yMatrix
    end
    
    methods
        function obj = side(xA,yA, xB, yB)
            %SIDE Construct an instance of this class
            %   Detailed explanation goes here
            obj.xA = xA;
            obj.yA = yA;
            obj.xB = xB;
            obj.yB = yB;
            obj.xMatrix = linspace(obj.xA, obj.xB, 1000);
            if((xB - xA) ~= 0)
                obj.m = (yB - yA)/(xB - xA);               
                obj.p = yA - obj.m*xA;
                obj.yMatrix = obj.m*obj.xMatrix + obj.p;
            else 
                obj.m = NaN;
                obj.p = NaN;
                obj.yMatrix = linspace(obj.yA, obj.yB, 1000);
            end
        end
        %%GETTER
        function [matrix] = getCoord(obj)
            matrix = [obj.xA obj.yA ; obj.xB obj.yB]
        end
        
        function [m, p] = getSlopeAndP(obj)
            m = obj.m;
            p = obj.p;
        end
        
        function x = getX(obj)
            x = obj.xA;
        end
        
        function [xMatrix, yMatrix] = getPointsMatrix(obj)
           xMatrix = obj.xMatrix;
           yMatrix = obj.yMatrix;
        end
    end
end

