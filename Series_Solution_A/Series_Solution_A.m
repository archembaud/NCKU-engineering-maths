function [] = Series_Solution_A()
    % Assume the form
    % y'' + py' + qy = 0
    % Assume the solution will be of the form:
    % y = a0 + a1(x-x0) + a2(x-x0)^2 .... + an(x-x0)^n
    % and we assume this series will converge for |x-x0| < rho
    % for some rho > 0.

    % Specifically, we are solving in this example
    % y'' + y = 0
    % We already know this has a general solution of:
    % y = A.cos(x) + B.sin(x)

    % Generate an array of x values
    x = 0:0.01:10;

    % Now, try looking at the influence the number of terms in the series
    % has on the accuracy of the solution.
    for no_terms = 2:3:20
        % Compute the sum at each x value
        for i = 1:1:length(x)
            y(i) = term1(no_terms, x(i));
        end
        % Plot the answer
        plot(x, y)
        hold on
    end
    % Set the axis
    axis([0 10 -2 2])

end


function [sum] = term1(no_terms, x)
    % This function computes the series representation of cos(x).
    sum = 0;
    % Set a0 = 1
    a0 = 1
    % Now we need to compute each term in the series at point x
    for term = 0:1:no_terms
        sum = sum + (((-1).^term)./factorial(2*term)).*x.^(2*term);
    end
    % Multiply by a0 (even though its 1 in this case)
    sum = sum*a0;
end