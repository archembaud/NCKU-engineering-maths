function [] = Series_Solution_B()
    % Here we are solving Airy's Equation
    % y'' + xy = 0
    % We'll show that this has two general solutions, with the 
    % particular solution being a linear combination of these depending
    % on the initial condition.

    % Generate an array of x values
    x = -10:0.01:2;

    % Now, try looking at the influence the number of terms in the series
    % has on the accuracy of the solution.
    for no_terms = 2:7:50
        % Compute the sum at each x value
        for i = 1:1:length(x)
            y(i) = term1(no_terms, x(i));
        end
        % Plot the answer
        plot(x, y)
        hold on
    end
    % Set the axis
    axis([-10 2 -1 2])

end


function [sum] = term1(no_terms, x)
    % This function computes the first possible solution of Airy's eqns
    sum = 1; % This solution starts with 1
    % Set a0 = 1
    a0 = 1;
    % Now we need to compute each term in the series at point x
    % The first term was 1; we start at term n = 1 and larger
    numerator = 1;
    for term = 1:1:no_terms
        numerator = numerator*(3*term).*(3*term - 1);
        sum = sum + x.^(3*term)./numerator;
    end
    % Multiply by a0 (even though its 1 in this case)
    sum = sum*a0;
end