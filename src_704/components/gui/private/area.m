function [a] = area(vector) % retorna Coulombs = vector(x)[Ampere] * x[Segundo]
    a=0;
    for i=2:1:length(vector)
    %a=a+abs((vector(i)-vector(i-1)));
    a = a+ (min(vector(i),vector(i-1))+abs(vector(i-1)-vector(i))/2)*(1*999/1000000);
    end
end