function [ xIntercept1, xIntercept2, yIntercept1, yIntercept2] = getTangeanteLineOfCollide(cercl,cercl2,xcf,ycf,xcf2,ycf2)
% initialisation valeurs pour calculs
r1 = cercl.radius;
r2 = cercl2.radius;
%% Calcul des points d'intersection des cercles
% valeurs intermédiaires pour equation second degré

if ycf2-ycf == 0
    A =1;
    B = -2*ycf2;
    A1 = 1;
    B1 = -2*xcf2;
    C1 = xcf2^2 + ycf2^2 - r2^2;
    C = Eq2Degree(A1,B1,C1);
    
     % equation du second degré trouvant xIntercept1 et xIntercept2
    [xIntercept1,xIntercept2] = Eq2Degree(A,B,C);
    % détermination de yIntercept1 et yIntercept2
    yIntercept1 = sqrt((cercl.radius^2) - (xIntercept1-xcf)^2 ) + ycf;
    yIntercept2 = sqrt((cercl2.radius^2) - (xIntercept2-xcf2)^2 ) + ycf2;
%     if xcf > xcf2
%         xIntercept1 = xcf - r0;
%     else
%         xIntercept1 = xcf + r0;
%     end
%     xIntercept2 = xIntercept1
%     yIntercept1 = 1
%     yIntercept2 = 2
% elseif xcf - xcf2 == 0
%     if ycf > ycf2
%         yIntercept1 = ycf - r0;
%     else
%         yIntercept1 = ycf + r0;
%     end
%     yIntercept2 = yIntercept1
%     xIntercept1 = 1
%     xIntercept2 = 2
else
    disp('EQUATION SECOND DEGRE');
    N = (r2^2 - r1^2 - xcf2^2 + xcf^2 - ycf2^2 + ycf^2)/(2*(ycf-ycf2));
    A = ((xcf-xcf2)/(ycf-ycf2))^2 + 1;
    B = (2*ycf*((xcf-xcf2)/(ycf-ycf2))) - (2*N*((xcf-xcf2)/(ycf-ycf2)))- (2*xcf);
    C = xcf^2 + ycf^2 + N^2 - r1^2 - (2*ycf*N);
    % equation du second degré trouvant xIntercept1 et xIntercept2
    [xIntercept1,xIntercept2] = Eq2Degree(A,B,C);
    % détermination de yIntercept1 et yIntercept2
    yIntercept1 = sqrt((cercl.radius^2) - (xIntercept1-xcf)^2 ) + ycf;
    yIntercept2 = sqrt((cercl.radius^2) - (xIntercept2-xcf)^2 ) + ycf;
end
%%
% Droite reliant les centre des deux cercles
a = (ycf2 - ycf)/(xcf2 - xcf);
b= ycf2-(a*xcf2);
VCC = @(x) (a*x) + b;

% Droite tangeante à la collision
m = -(1/a);
p = yIntercept1 - (m*xIntercept1);
VCCP = @(x) (m*x)+p;

end
