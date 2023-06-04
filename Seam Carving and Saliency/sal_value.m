function [salvals] = sal_value(pcolor,a)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
salvals = zeros ([20 20]) ;

for i=1:a
    for j = 1:a
        for x = 1:a
            for y = 1:a
                colord = sqrt(sum((squeeze(pcolor(i,j,:))-squeeze(pcolor(x,y,:))).^2));
                pdi = sqrt(sum(([i;j]-[x;j]).^2));
                salvals(i,j) = salvals(i,j)+colord/(1+3*pdi);
            end
        end
    end
end
end

