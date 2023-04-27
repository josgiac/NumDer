%TEST for FUNCTION ---> [d,ifail] = NumDerEquispacedData(a,b,nu,f)
%---------------Parameter to change
%[a,b] domain of the function F
a=0;
b=1;
%n+1 number of known values of F
n=25; 
% type   - type of function
%          type=1 --> f(x)=1/(1+x^2);
%          type=2 --> f(x)=cos((1+x)^2)
%          type=3 --> f(x)=exp(x)
type=3;
%DerOrd - Order of the derivative=nu
%         For type=1,2   DerOrd=1,2,3
%         For type=3   DerOrd=1,2,3, ....
DerOrd=1; 

%---------------END Parameter to change

%---------------
h=1/n; %step in [0,1]
hTrue=(b-a)/n; %step in [a,b]
vxi=a:hTrue:b; 
f=Fun(vxi,type);
fprintf('\n Derivative of order %i of function of type %i\n',DerOrd,type)
fprintf('\n Number of data = %i, step in [0,1]= %1.5e\n',n+1,h)

m=n-DerOrd+1;
aNew=a+DerOrd*hTrue/2;
bNew=a+(m-1+DerOrd/2)*hTrue;
vx=aNew:hTrue:bNew;
%True derivative of Fun(x,type) of order DerOrd
TrueDf=DerFun(vx,type,DerOrd); 
%DF  computed derivative of Fun(x,type) of order DerOrd
[Df,ifail] = NumDerEquispacedData(a,b,DerOrd,f); 
if ifail>0
    fprintf('\n ifail=%i for the derivative of order %i \n',ifail,DerOrd)
else
figure, plot(vx,Df,'r*',vx,TrueDf,'bo')
title('True Derivative (blue) and Computed One (red)')
% --- ERRORS --- %
Errors = Df-TrueDf; % Error function
Err2=norm(Errors)/sqrt(m); % Mean squared Error 
Err2Int=norm(Errors(2:m-1))/sqrt(m-2); % Mean squared Error without first and last 
Err_infFirst=abs(Df(1)-TrueDf(1)); % Absolute error at first point
Err_infLast=abs(Df(m)-TrueDf(m)); % Absolute error at last point
Err_infInt=norm(Errors(2:(m-1)),inf); % Infinity error without first and last point
Err_inf=norm(Errors,inf); % Infinity Error
norm2=norm(TrueDf);
Err2_rInt=norm(Errors(2:m-1))/norm(TrueDf(2:m-1)); % 2-norm relative error without first and last point
Err2_r=norm(Errors)/norm2; % 2-norm relative error 

figure,
plot(vx,Errors,'r*');
title('Errors')

figure
plot(vx(2:m-1),Errors(2:m-1),'r*');
title('Internal Errors without first and last')

end
