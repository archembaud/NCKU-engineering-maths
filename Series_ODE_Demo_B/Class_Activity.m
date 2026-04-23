function [] = Class_Activity()
    % Set DX
    h = 0.25;
    x = 0:h:2;
    yx = Compute_Sum(x, 1, -1);
    plot(x, yx)
    % Compute Euler
    yx2 = Compute_Euler(1, -1, h);
    hold on
    plot(x, yx2,'r--')
    legend('Series Solution (N=4)', 'Euler Solution')
end

function [solution] = Compute_Sum(x,a0,a1)
    % As mentioned in the PDF, in this case we set
    % k to be 0.5
    k = 0.5;
    % Compute each series to 4 terms
    y1 = a0.*(1 - (k.^2.*x.^4/(3*4)) + (k.^4.*x.^8/(3*4*7*8)) - (k.^6.*x.^12/(3*4*7*8*11*12)));
    y2 = a1.*(x - (k.^2.*x.^5/(4*5)) + (k.^4.*x.^9/(4*5*8*9)) - (k.^6.*x.^13/(4*5*8*9*12*13)));
    solution = y1 + y2;
end


function [solution] = Compute_Euler(a0, a1, h)

    y = [a0, a1]; % This is y and dydx.
    k = 0.5;
    no_steps = 8;
    x = 0;
    S = sprintf('At t = 0, y = %g\n', y(1));
    disp(S)
    solution(1) = a0;
    for step = 1:1:no_steps
        % Compute D/DX for y
        dydx(1) = y(2);
        dydx(2) = -(k^2)*(x.^2)*y(1);
        % Now update y
        y(1) = y(1) + dydx(1)*h;
        y(2) = y(2) + dydx(2)*h;
        x = x + h;
        S = sprintf('At t = %g, y = %g\n', x, y(1))
        % Store y(t) so we can plot it
        solution(step+1) = y(1);
    end
end