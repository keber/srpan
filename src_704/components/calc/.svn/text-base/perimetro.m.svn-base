function [p] = perimetro(vector)
%calcula el perimetro de un vector ****TODO:REVISAR
 p=0;
% n=100000;
 for x2=2:1:length(vector)
%     y2=vector(x2)*n;
%     y1=vector(x2-1)*n;
%     d=sqrt(1 +  ( ((max(y2,y1)-min(y2,y1))^2)/n^2) );
%     %d=sqrt( abs((x2-x1)^2) + abs((y2-y1)^2));
%     %d=sqrt( 1 + abs((vector(x2)-vector(x2-1))^2));
%     %d = abs(sqrt( (abs(x2-(x2-1)))^2 + (abs(vector(x2)-vector(x2-1)))^2 ));
    p2=[x2 vector(x2)];
    p1=[(x2-1) vector(x2-1)];
    d=sqrt( sum((p2-p1).^2) );
    p=p+d;
 end
%p;
%p = norm(vector);

