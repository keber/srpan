function [y] = filtro_promedio(vector,d)
n=length(vector);
% preparando el vector columna de salida
y=zeros(n,1);
if d>0 
    for i=d:n-d+1
        temp=vector((i-d+1):(i+d-1));
        %y(i-d+1)=sum(temp)/length(temp);
        y(i)=sum(temp)/length(temp);
    end
end

