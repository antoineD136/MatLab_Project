function isIntersected = circleIntersect(circle1,circle2,xcf,ycf,xcf2,ycf2)
distance = getDistanceBetweenCircle(xcf,ycf,xcf2,ycf2);
isIntersected = 0;
if distance <= (circle1.radius + circle2.radius)
   isIntersected = 1;
end
end
