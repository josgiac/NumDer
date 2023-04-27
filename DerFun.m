function [y] = DerFun(x,type,DerOrd)
% [y] = DerFun(x,type,DerOrd)
% INPUT:
% x      - double array
% DerOrd - order of the derivative DerOrd=1,2,3
% type   - type of function
%          type=1 --> f(x)=1/(1+x^2);
%          type=2 --> f(x)=cos((1+x)^2)
%          type=3 --> f(x)=exp(x)
% OUTPUT:
% y      - double array
%          y=derivative of order DerOrd   

switch type
    case 1 % y=1/(1+x^2);
        switch DerOrd
            case 1
                y=-2.*x./((1+x.^2).^2);
            case 2 
                y=(6.*(x.^2)-2)./((1+x.^2).^3);
            case 3
                y=(24.*x)./((1+(x.^2)).^3)-(48.*(x.^3))./((1+(x.^2)).^4);
        end
    case 2  % y=cos((1+x)^2);
        switch DerOrd
            case 1
                y=-2.*(1+x).*sin((1+x).^2);
            case 2 
                y=-2.*sin((1+x).^2)-4.*((1+x).^2).*cos((1+x).^2);
            case 3
                y=8.*((1+x).^3).*sin((1+x).^2)-12.*(1+x).*cos((1+x).^2);
        end
    case 3  % y=exp(x);
        y=exp(x);
end

