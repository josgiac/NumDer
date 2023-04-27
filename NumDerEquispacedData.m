function [d,ifail] = NumDerEquispacedData(a,b,nu,f)
% [d,ifail] = NumDerEquispacedData(a,b,nu,f)
% INPUT:
% [a,b]    - domanin of the function F
% nu       - order of the computed derivative of F, o=1,2,...
% f(1:n+1) - vector containing the values of F at n+1 uniformly distributed points
%            in [a,b] ---> f(j)=F(a+(j-1)(b-a)/n);
% OUTPUT:
% d(1:m)   - derivative of order nu of F, m=n-nu+1, m must be >=3; 
%            d(j)=derivative of order nu of F at x=a+(j-1+nu/2)(b-a)/n;
% ifail    - Error Indicators and Warnings 
%            ifail=0 --> no error detected;
%            ifail=1 --> on entry  a>=b or o<1;
%            ifail=2 --> the method cannot be applied because n<o+2,

n=length(f);
n=n-1;
ifail=0;
if (a>=b || nu<1)
    ifail=1;
elseif n< nu+2
        ifail=2;
end
if ifail >0
    d=0*f;
    return;
end
hTrue=(b-a)/n; % discretiztion step in [0,1]
h=1/n; % discretiztion step in [0,1]
g=f(2:n+1)-f(1); 
gg=2*g; 
gg(n)=g(n);
tt=(1:n)/(2*n);  
ff=(1:n)-0.5;
dst = - imag(nufft(gg,tt,ff))/sqrt(n); 
Fg=zeros(1,n);
VetGamma=pi*(1:2:2*n-1)/2;
sL0=sin(h*VetGamma/2);
sL1=sin(3*h*VetGamma/2);
cL0=cos(h*VetGamma/2);
cLnm1=cos(h*(2*n-1)*VetGamma/2);
gtp0=(-1689*f(1)+1005*f(2)+1430*f(3)-1110*f(4)+435*f(5)-71*f(6))/(1920*h);
gtpnm1=-(-1689*f(n+1)+1005*f(n)+1430*f(n-1)-1110*f(n-2)+435*f(n-3)-71*f(n-4))/(1920*h);
AppcL0=(sqrt(2*n)/24)*(-26*g(1)+g(2))+(sqrt(2/n))*gtp0;
AppcLnm1=(sqrt(2*n)/24)*(-27*g(n)-g(n-2)+28*g(n-1))+(sqrt(2/n))*gtpnm1;
for s=0:n-1
  App=AppcL0*cL0(s+1)+AppcLnm1*cLnm1(s+1);
  Fg(s+1)=(n*sqrt(2)/24)*(27*sL0(s+1)-sL1(s+1))*dst(s+1)+App;
end
d=dct(Fg,'Type',4)/(b-a);
for p=2:nu %computation of derivatives of order p> 1, p<=nu.
    m=n-p+1;
    na=a+hTrue*(p-1)/2;
    nb=a+hTrue*(m+(p-1)/2);
    [d,ifail]=NumDerEquispacedData(na,nb,1,d);
end
end

