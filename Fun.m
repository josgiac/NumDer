function [y] = Fun(x,type)
% [y] = Fun(x,type)
% INPUT:
% x      - double array
% type   - type of function
%         type=1 --> f(x)=1/(1+x^2);
%         type=2 --> f(x)=cos((1+x)^2)
%         type=3 --> f(x)=exp(x)
% OUTPUT:
% y      - double array y=f(x)

switch type
    case 1
        y=1./(1+x.^2);
    case 2
        y=cos((1+x).^2);
    case 3
        y=exp(x);
end


end

