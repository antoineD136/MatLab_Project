function [v1Prim,v2Prim] = getNewVelocityVectorFromCircleCollide( circle1, circle2) % Fonction pour définir le nouveau vecteur vitesse du cercle effectuant la collision
V1 = [circle1.vVector.projectedSpeedVx ; circle1.vVector.projectedSpeedVy]
V2 = [circle2.vVector.projectedSpeedVx ; circle2.vVector.projectedSpeedVy]
normalVector = [(circle2.finalX - circle1.finalX ); (circle2.finalY - circle1.finalY)]
unitNormalVector = normalVector / norm(normalVector)
unitTangentVector = [-unitNormalVector(2,1) ; unitNormalVector(1,1)]
normalV1 = dot(unitNormalVector, V1)
tangentV1 = dot(unitTangentVector, V1)
normalV2 = dot(unitNormalVector, V2)
tangentV2 = dot(unitTangentVector, V2)
tangentV1Prim = tangentV1
tangentV2Prim = tangentV2
normalV1Prim = ((normalV1 * (circle1.mass - circle2.mass)) + (2*circle2.mass*normalV2))/(circle1.mass + circle2.mass)
normalV2Prim = ((normalV2 * (circle2.mass - circle1.mass)) + (2*circle1.mass*normalV1))/(circle1.mass + circle2.mass)
normalV1Prim = normalV1Prim * unitNormalVector
normalV2Prim = normalV2Prim * unitNormalVector
tangentV1Prim = tangentV1Prim * unitTangentVector
tangentV2Prim = tangentV2Prim * unitTangentVector
v1Prim = normalV1Prim + tangentV1Prim
v2Prim = normalV2Prim + tangentV2Prim





% %Vecteurs vitesses cercle1 et cercle2 
%     V1 = [circle1.vVector.projectedSpeedVx circle1.vVector.projectedSpeedVy];
%     V2 = [circle2.vVector.projectedSpeedVx circle2.vVector.projectedSpeedVy];
%     % r parallèle
%     AxisPerpen = [(circle2.finalX - circle1.finalX ); (circle2.finalY - circle1.finalY)];
%     % r perpendiculaire
%     uPerpen = AxisPerpen /norm(AxisPerpen);
%     % Composantes U
%     % U Parallèle
%     uPara = [-uPerpen(2,1) ; uPerpen(1,1)];
%     % U Perpendiculaire
%     % Calcul des composantes de w'
%     % Calcul de w Parallèle
%     w1Para = V1 * uPara;
%     % Calcul de w perpendiculaire
%     w1Perpen = V1 * uPerpen;
%     w2Para = V2 * uPara;
%     w2Perpen = V2 * uPerpen;
%     w2PrimPara = w2Para;
%     w1PrimPara = w1Para;
%     % Calcul des w' perpendiculaires
%     w1PrimPerpen = (w1Perpen*(circle1.mass - circle2.mass) + 2*circle2.mass*w2Perpen)/(circle1.mass + circle2.mass);
%     w2PrimPerpen = (w2Perpen*(circle2.mass - circle1.mass) + 2*circle1.mass*w1Perpen)/(circle1.mass + circle2.mass);
%     % Calcul des w'
%     w2PrimPara = w2PrimPara * uPara;
%     w1PrimPara = w1PrimPara * uPara;
%     
%     w1PrimPerpen = w1PrimPerpen * uPerpen;
%     w2PrimPerpen = w2PrimPerpen * uPerpen;
%     
%     v1Prim = w1PrimPara + w1PrimPerpen;
%     v2Prim = w2PrimPara + w2PrimPerpen;
end
