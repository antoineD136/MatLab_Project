function [normalLineX, normalLineY, tangentLineX, tangentLineY] = getCollideAxis(circle1, circle2, normalVector)
%Partie pour l'axe normal aux cercles
mNormalLine = normalVector(2,1) / normalVector(1,1);
pNormalLine = circle1.finalY - mNormalLine*circle1.finalX;
normalLineX = linspace(circle1.finalX, circle2.finalX);
normalLineY = normalLineX*mNormalLine + pNormalLine;
%%Partie pour l'axe tangent aux cercles
mTangentLine = -1 / mNormalLine;
collisionPointX = (circle1.finalX*circle2.radius + circle2.finalX*circle1.radius)/(circle1.radius + circle2.radius);
collisionPointY = (circle1.finalY*circle2.radius + circle2.finalY*circle1.radius)/(circle1.radius + circle2.radius);
pTangentLine = collisionPointY - collisionPointX*mTangentLine;
tangentLineX = linspace(collisionPointX - 0.1, collisionPointX + 0.1);
tangentLineY = tangentLineX*mTangentLine + pTangentLine;
end

