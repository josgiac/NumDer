%TEST for FUNCTION ---> [d,ifail] = NumDerEquispacedData(a,b,o,f)
%---------------Parameter to change
%[a,b] domain of f
a=0;
b=1;
%n+1 of known values of F
n=800; 
% type   - type of function
%         type=1 --> f(x)=1/(1+x^2);
%         type=2 --> f(x)=cos((1+x)^2)
%         type=3 --> f(x)=exp(x)
type=1;
%DerOrd - Order of the derivative
%   For type=1,2   DerOrd=1,2
%   For type=3   DerOrd=1,2,3, ....
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
%vx=a+hTrue/2:hTrue:b; IF DerOrd=1

TrueDf=DerFun(vx,type,DerOrd);

% --- FIRST DERIVATIVE --- %
% figure
% plot(vxi,f,'r*',vx,TrueDf,'bo');
% title('f e Df')
% NNder=1;
%---Computation of the derivative of order DerOrd
[Df,ifail] = NumDerEquispacedData(a,b,DerOrd,f);
fprintf('\n ifail for the derivative of order %i = %i\n',DerOrd,ifail)

figure, plot(vx,Df,'r*',vx,TrueDf,'bo')
title('True Derivative (blue) and computed one (red)')

% --- ERRORS --- %
Errors = Df-TrueDf; % Errors
Err2=norm(Errors)/sqrt(m); % Mean squared Error 
Err2Int=norm(Errors(2:m-1))/sqrt(m-2); % Mean squared Error without first and last 
Err_infFirst=abs(Df(1)-TrueDf(1)); % absolute error at first point
Err_infLast=abs(Df(m)-TrueDf(m)); % absolute error at last point
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

% NNder=2; % Second derivative
% OrdDer=NNder;
% %d=0; % Number of deleted points from each end
% %est_a=a+d*(NNder-1)*hTrue+NNder*hTrue/2;
% %est_b=(b-(d*(NNder-1)*hTrue+NNder*hTrue/2));
% est_a=a+NNder*hTrue/2;
% m=n-NNder+1;
% est_b=a+(m-1+NNder/2)*hTrue;
% vvx=est_a:hTrue:est_b;
% TrueDDf=exp(vvx); % True derivative
% % 
% %DDf=NOD(a,b,n,f,d,NNder); 
% [DDf,ifail] = NumDerEquispacedData(a,b,OrdDer,f);
% fprintf('\n ifail per la derivata %i = %i\n',OrdDer,ifail)
% 
% figure, plot(vvx,DDf,'r*',vvx,TrueDDf,'bo'); % Plot comparison of true and approximated derivative
% title(' DDf red - TrueDDF blue')
% 
% % --- ERRORS --- %
% ErrorsDerNN = DDf-TrueDDf; % Errors
% figure, plot(vvx,ErrorsDerNN,'r*'); % Plot comparison of true and approximated derivative
% title('ErrorsDerNN')
% nDerNN=length(ErrorsDerNN);
% Err2DerNN=norm(ErrorsDerNN)/sqrt(nDerNN); % Mean squared Error (senza primo e ultimo)- E_2 of the article pag.8 
% Err2DerNNInt=norm(ErrorsDerNN(2:nDerNN-1))/sqrt(nDerNN-2); % Mean squared Error (senza primo e ultimo)- E_2 of the article pag.8 
% Err_infDerNNInt=norm(ErrorsDerNN(2:(nDerNN-1)),inf); % Infinity error without first and last points - - E_\infty of the article pag 8
% Err_infDerNN=norm(ErrorsDerNN,inf); % Infinity error without first and last points - - E_\infty of the article pag 8
% norm2DerNN=norm(TrueDDf);
% Err_rDerNNInt=norm(ErrorsDerNN(2:nDerNN-1))/norm(TrueDDf(2:nDerNN-1)); % 2-norm relative error (senza primo e ultimo)- E_2 of the article pag.8 
% Err_rDerNN=norm(ErrorsDerNN)/norm(TrueDDf); % 2-norm relative error (senza primo e ultimo)- E_2 of the article pag.8 
% 

% Err2=norm(Errors)/length(Errors); % Mean 2-norm Error
% Err_inf=norm(Errors,inf); % Infinity Error
% norm2=norm(TrueDDf)/length(TrueDDf);
% Err_r=Err2/norm2; % 2-norm relative error