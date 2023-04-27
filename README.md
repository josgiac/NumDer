# NumDer
contains codes in Matlab, in particular, there are 3 functions (NumDerEquispacedData, Fun, DerFun) and 1 script (Test) to tset the proposed algorithm: NumDerEquispacedData.

Purpose: Compute the derivative of order nu of a function starting from its values at uniformly distributed points on a closed interval
# NumDerEquispacedData
Sintax: [d,ifail]=NumDerEquispacedData(a,b,nu,f)

Purpose: Compute the derivatives of a function F starting from its values (f) at uniformly distributed points.

Description: Given a vector f containing the (n+1) values of function F at k(b-a)/n, k=0,1,...,n, computes 
d=(d1,d2,...,dm) the derivatives of order nu of F at a+(k+nu/2)(b-a)/n, k=0,1,...,m-1, m=n-nu+1,

Parameters:

input a, b - double scalar. The closed interval $[a,b]$ is the domain of $F$. (Constraints: a<b)

input nu - integer scalar.  The values of $nu$ is the order of the searched derivatives. (Constraints: $nu\ge 1$)

input $f$ - double vector with $n+1$ components. $f(j+1)$ must contain $F\left(a+j(b-a)/n\right)$, $j=0,1,\dots,n$. {\it Constraints:} $n\ge nu+2$.
        \item {\bf output $d$} - double vector with $m=n-nu+1$ components. $d(j+1)$  contains the approximation of $$F^{(nu)}\left(a+\left(j+\frac{nu}{2}\right)\frac{b-a}{n}\right),\quad j=0,1,\dots,m-1.$$ 
        \item {\bf output $ifail$} – integer scalar, $ifail=0$ unless the function detects an error (see Error Indicators and Warnings).
    \end{itemize}
    \item{\bf Error Indicators and Warnings.} Here is the list of errors or warnings detected by the function:
    \begin{itemize}
        \item {\bf $ifail=1$} - on entry  $a\ge b$	or $nu\le 0$.
 	\item {\bf $ifail=2$} - the method cannot be applied because $n<nu+2$.
    \end{itemize}
\end{itemize}

# Fun
