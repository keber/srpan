function [x,y] = minpos(vector)
    [V,IX] = sort(vector,'ascend');
    y=V(1);
    x=IX(1);
end