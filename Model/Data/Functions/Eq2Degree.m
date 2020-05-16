function [x1, x2] = Eq2Degree(A,B,C)
if A == 0
    if B == 0
        if C == 0
            disp('tout x est solution')
        else
            disp('pas de solution')
        end
        X = (-c/b);
    end
else
    Delta = B^2-(4*A*C);
    if Delta == 0
        X = -B/(2*A);
    else
        x1 = (-B-sqrt(Delta))/(2*A);
        x2 = (-B+sqrt(Delta))/(2*A);
    end
end

end
