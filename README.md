# NumDer
It contains codes in Matlab, in particular, there are 3 functions (NumDerEquispacedData, Fun, DerFun) and 1 script (Test) to test the algorithm proposed and implemented in NumDerEquispacedData.

Purpose: Compute the derivative of order $nu$ of a function $F$ starting from its values at uniformly distributed points on a closed interval $[a,b]$.
# NumDerEquispacedData
Syntax: $[d,ifail]=NumDerEquispacedData(a,b,nu,f)$

Purpose: Compute the derivatives of a function $F$ starting from its values ($f$) at uniformly distributed points.

Description: Given a vector $f$ containing the $n+1$ values of the function $F$ at $k(b-a)/n$, $k=0,1,...,n,$ computes 
$d=(d1,d2,...,dm)$ the derivatives of order $nu$ of $F$ at $a+(k+nu/2)(b-a)/n,$ $k=0,1,...,m-1$, $m=n-nu+1.$

Parameters:

input $a, b$ - double scalar. The closed interval $[a,b]$ is the domain of $F$. (Constraints: $a < b$)

input $nu$ - integer scalar.  The value of $nu$ is the order of the searched derivatives. (Constraints: $nu>= 1$)

input $f$ - double vector with $n+1$ components, $f(j+1)$ must contain $F\left(a+j(b-a)/n\right)$, $j=0,1,\dots,n$. (Constraints: $n>= nu+2$)

output $d$ - double vector with $m=n-nu+1$ components, $d(j+1)$  contains the approximation of $$F^{(nu)}\left(a+\left(j+\frac{nu}{2}\right)\frac{b-a}{n}\right),\quad j=0,1,\dots,m-1.$$ 

output $ifail$ – integer scalar, $ifail=0$ unless the function detects an error (see Error Indicators and Warnings).
    
Error Indicators and Warnings. Here is the list of errors or warnings detected by the function: 
        
        ifail=1 - on entry (a >= b) or (nu <= 0).
 	
        (ifail=2) - the method cannot be applied because (n < nu+2).
    
# Test
Script that can be used to test [d,ifail] = NumDerEquispacedData(a,b,nu,f)

In particular you can choose the following parameters:

$[a,b]$ - the domain of the function $F$

$n+1$ - the number of known values of $F$

type  -  the type of function given by Fun(x,type) that we want to test 
    
    type=1 --> f(x)=1/(1+x^2);
    
    type=2 --> f(x)=cos((1+x)^2)
    
    type=3 --> f(x)=exp(x)

DerOrd - the Order of the Derivative $= nu$
    
    For type=1,2   DerOrd=1,2,3
    
    For type=3   DerOrd=1,2,3, ....

# Fun
[y] = Fun(x,type) is the function used in Test.
# DerFun
[y] = DerFun(x,type,DerOrd) is the analytical derivative of Fun of order DerOrd.
# References

[1] N. Egidi, J. Giacomini, P. Maponi, M. Youssef, 
"An FFT method for the numerical differentiation",
Applied Mathematics and Computation, 445:127856, 2023.

[2]	N. Egidi, J. Giacomini, P. Maponi, 
"A Fredholm integral operator for the differentiation problem", 
Computational and Applied Mathematics, 41(5):220, 2022.

[3] N. Egidi, P. Maponi,
"A spectral method for the solution of boundary value problems",
Applied Mathematics and Computation, 409:125812, 2021.

[4] N. Egidi, P. Maponi,
"An SVE Approach for the Numerical Solution of Ordinary Differential Equations",
 Sergeyev Y., Kvasov D. (eds) Numerical Computations: Theory and Algorithms. NUMTA 2019. Lecture Notes in Computer Science, Springer, Cham,
 11973:70-85, 2020.

[5] N. Egidi, P. Maponi, 
"The singular value expansion of the Volterra integral equation associated to a numerical differentiation problem",
Journal of Mathematical Analysis and Applications, 460:656-681, 2018.
