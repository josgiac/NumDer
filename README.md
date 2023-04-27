# NumDer
It contains codes in Matlab, in particular, there are 3 functions (NumDerEquispacedData, Fun, DerFun) and 1 script (Test) to test the proposed algorithm: NumDerEquispacedData.

Purpose: Compute the derivative of order $nu$ of a function starting from its values at uniformly distributed points on a closed interval
# NumDerEquispacedData
Sintax: $[d,ifail]=NumDerEquispacedData(a,b,nu,f)$

Purpose: Compute the derivatives of a function $F$ starting from its values ($f$) at uniformly distributed points.

Description: Given a vector $f$ containing the $n+1$ values of function $F$ at $k(b-a)/n$, $k=0,1,...,n,$ computes 
$d=(d1,d2,...,dm)$ the derivatives of order $nu$ of $F$ at $a+(k+nu/2)(b-a)/n,$ $k=0,1,...,m-1$, $m=n-nu+1.$

Parameters:

input $a, b$ - double scalar. The closed interval $[a,b]$ is the domain of $F$. (Constraints: $a < b$)

input $nu$ - integer scalar.  The values of $nu$ is the order of the searched derivatives. (Constraints: $nu>= 1$)

input $f$ - double vector with $n+1$ components, $f(j+1)$ must contain $F\left(a+j(b-a)/n\right)$, $j=0,1,\dots,n$. (Constraints: $n>= nu+2$)

output $d$ - double vector with $m=n-nu+1$ components, $d(j+1)$  contains the approximation of $$F^{(nu)}\left(a+\left(j+\frac{nu}{2}\right)\frac{b-a}{n}\right),\quad j=0,1,\dots,m-1.$$ 

output $ifail$ – integer scalar, $ifail=0$ unless the function detects an error (see Error Indicators and Warnings).
    
Error Indicators and Warnings. Here is the list of errors or warnings detected by the function:
        
        $ifail=1$ - on entry $a >= b$ or $nu <= 0$.
 	
        $ifail=2$ - the method cannot be applied because $n < nu+2$.
    
# Test
is a script that can be used to test [d,ifail] = NumDerEquispacedData(a,b,nu,f)

In particular you can choose the following parameters

$[a,b]$ - the domain of the function $F$

$n+1$ - the number of known values of $F$

type  -  the type of the function given by Fun(x,type) that we want to test 
    
    type=1 --> f(x)=1/(1+x^2);
    
    type=2 --> f(x)=cos((1+x)^2)
    
    type=3 --> f(x)=exp(x)

DerOrd - the Order of the Derivative $= nu$
    
    For type=1,2   DerOrd=1,2,3
    
    For type=3   DerOrd=1,2,3, ....

# Fun
[y] = Fun(x,type) is the function used in Test
# DerFun
[y] = DerFun(x,type,DerOrd) is the derivative of Fun of order DerOrd
