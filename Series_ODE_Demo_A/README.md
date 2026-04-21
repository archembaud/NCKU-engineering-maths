# Series Solution to ODE - Demonstration A

This code shows the results from the series solution to this ODE:

$y''-xy'-y=0$

with $y(x=0) = 1$ and $y'(x=0) = -1$. In class, I showed the analytical solution to be:

$y(x) = a_0\left(1 + x^2/2 + x^4/2.4 + x^6/2.4.6 + ... x^{2n}/2^n n!\right) + \\ a_1\left(x + x^3/3 + x^5/3.5 + x^7/3.5.7 .... 2^n n! x^{2n+1}/(2n+1)!\right) $

In this folder there are two m codes:
* Compute_Series_A.m : Holds a function called Compute_Series_A which computes the sums above, using a given x value, number of terms N and initial conditions $a_0$ and $a_1$.
* Solve_ODE.m: Holds a function called Solve_ODE() which computes y(x) for x = 0 to 2 and plots the results. In this code, my series computation uses 10 terms at each x - you can increase (or decrease this) to see how the number of terms affects the accuracy.

Here are the results:

![Solution](./Solution.png)

This can be checked using Simulink - I've also included the model in this folder for you to load and run:

![Simulink](./Simulink_Solution.png)

The MATLAB code can be downloaded directly from the repository - however, you can see the function here as well:

```matlab
function [solution] = Compute_Series_A(x,N, a0, a1)
    % Compute the series solution for
    % the ODE y'' - xy' - y = 0
    % This ODE has two series solutions
    disp(sprintf('Computing series solution at x = %g using %d terms\n', x, N));
    sum1 = 0;
    sum2 = 0;
    for i = 0:1:N-1
        term1 = x.^(2*i)/(2.^(i).*factorial(i));
        term2 = (2.^i)*factorial(i)*x.^(2*i+1)./factorial(2*i+1);
        S = sprintf("Adding term %d to series 1 and 2 of %g, %g\n", i, term1, term2);
        disp(S);
        sum1 = sum1 + term1;
        sum2 = sum2 + term2;
    end
    solution = a0*sum1 + a1*sum2;
end
```

It's worth noting that the overall solution to the ODE is the sum of each series, with the coefficients $a_o$ and $a_1$ (in this case) being the initial values of $y$ and $y'$.