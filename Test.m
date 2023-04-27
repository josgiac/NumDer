% TEST for FUNCTION ---> [d,ifail] = NumDerEquispacedData(a,b,nu,f)
% --------------- Parameters to change ---------------- %
% [a,b] Domain of the function f
a=0;
b=1;

% n+1 Number of known values of the function f
n=25; 

% type   - type of function
%          type=1 --> f(x)=1/(1+x^2);
%          type=2 --> f(x)=cos((1+x)^2)
%          type=3 --> f(x)=exp(x)
type=3;

% DerOrd - Order of the derivative=nu
%          For type=1,2   DerOrd=1,2,3
%          For type=3     DerOrd=1,2,3,...
DerOrd=1; 

% --------------- END Parameters to change --------------- %

% ------------------------------------------------------- %

% Discretization step in [a,b]
hTrue=(b-a)/n;

fprintf('\n Derivative of order %i of function of type %i\n',DerOrd,type)
fprintf('\n Number of data = %i, step in [%g,%g]= %1.5e\n',n+1,a,b,hTrue)

% --------------- True derivative --------------- %
% True derivative equispaced points
m=n-DerOrd+1;
aNew=a+DerOrd*hTrue/2;
bNew=a+(m-1+DerOrd/2)*hTrue;
vx=aNew:hTrue:bNew;

% True derivative of Fun(x,type) of order DerOrd
TrueDf=DerFun(vx,type,DerOrd); 

% --------------- NDED --------------- %
% Equispaced points
vxi=a:hTrue:b; 

% Function selection
f=Fun(vxi,type);

% Computation of the derivative of Fun(x,type) of order DerOrd
[Df,ifail] = NumDerEquispacedData(a,b,DerOrd,f); 

% Check for errors or warnings
if ifail>0
    fprintf('\n ifail=%i for the derivative of order %i \n',ifail,DerOrd)
else 
% Comparison plot of true derivative and NDED
figure, plot(vx,Df,'r*',vx,TrueDf,'bo')
title('True Derivative (blue) and Computed One (red)')

% --------------- Errors --------------- %
% Error Function
Errors = Df-TrueDf; 

% Mean Squared Error 
Err2=norm(Errors)/sqrt(m); 

% Mean Squared Error without first and last points
Err2Int=norm(Errors(2:m-1))/sqrt(m-2);  

% Absolute Error at first point 
Err_infFirst=abs(Df(1)-TrueDf(1)); 

% Absolute Error at last point
Err_infLast=abs(Df(m)-TrueDf(m)); 

% Infinity Error without first and last points
Err_infInt=norm(Errors(2:(m-1)),inf); 

% Infinity Error
Err_inf=norm(Errors,inf); 

% 2-Norm Relative Error without first and last points
Err2_rInt=norm(Errors(2:m-1))/norm(TrueDf(2:m-1)); 

% 2-Norm Relative Error 
norm2=norm(TrueDf);
Err2_r=norm(Errors)/norm2; 

% Plot of the Error Function
figure,
plot(vx,Errors,'r*');
title('Errors')

% Plot of the Error Function without first and last points
figure
plot(vx(2:m-1),Errors(2:m-1),'r*');
title('Internal Errors without first and last points')

end
