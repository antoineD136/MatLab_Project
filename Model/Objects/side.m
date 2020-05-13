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
            if((xB - xA) > 0 + 0.0001 || (xB - xA) < 0 - 0.0001)
                obj.m = (yB - yA)/(xB - xA);               
                obj.p = yA - obj.m*xA;
                obj.yMatrix = obj.m*obj.xMatrix + obj.p;
            else 
                obj.m = NaN;
                obj.p = 0;
                obj.yMatrix = linspace(obj.yA, obj.yB, 1000);
            end
        end
        %%SETTER
        function obj = set.xA(obj, xA)
            obj.xA = xA;
        end
        function obj = set.yA(obj, yA)
            obj.yA = yA;
        end
         function obj = set.xB(obj, xB)
            obj.xB = xB;
        end
        function obj = set.yB(obj, yB)
            obj.yB = yB;
        end
        function obj = set.m(obj, m)
            obj.m = m;
        end
        function obj = set.p(obj, p)
            obj.p = p;
        end
        function obj = set.xMatrix(obj, xMatrix)
            obj.xMatrix = xMatrix;
        end
        function obj = set.yMatrix(obj, yMatrix)
            obj.yMatrix = yMatrix;
        end
        %%GETTER
        function [matrix] = getCoord(obj)
            matrix = [obj.xA obj.yA ; obj.xB obj.yB]
        end        
        function [m, p] = getSlopeAndP(obj)
            m = obj.m;
            p = obj.p;
        end        
        function m = getSlope(obj)
            m = obj.m;
        end
        function x = getX(obj)
            x = obj.xA;
        end  
        function y = getY(obj)
            y = obj.yA;
        end  
        function [xMatrix, yMatrix] = getPointsMatrix(obj)
           xMatrix = obj.xMatrix;
           yMatrix = obj.yMatrix;
        end
    end
end

