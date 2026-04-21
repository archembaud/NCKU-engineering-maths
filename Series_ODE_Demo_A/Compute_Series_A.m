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
    sum1 = sum1*a0;
    sum2 = sum2*a1;
    solution = sum1 + sum2;
end