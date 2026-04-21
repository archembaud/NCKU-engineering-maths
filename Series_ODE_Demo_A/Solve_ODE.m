function [] = Solve_ODE()
    x = 0:0.01:2;
    y = Compute_Series_A(x, 10, 1, -1);
    plot(x,y)
end