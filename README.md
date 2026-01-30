# NCKU-engineering-maths
A collection of tools and docs to support the NCKU class on engineering mathematics.

## Euler's Method Example

Here we solve the ODE:

```math
\frac{dy}{dt} + 2y = 2 - e^{-4t}
```
where y(0) = 1 using dt = 0.1 with Euler's method and Simulink.

The best way to prepare yourself for solving this ODE using a numerical method is to rewrite the ODE in terms of the lowest derivative:

```math
\frac{dy}{dt} = 2 - e^{-4t} - 2y
```

And updating the value of y at step k+1 using:

```math
y(k+1) = y(k) + (\frac{dy}{dy})_k \Delta t
```

The working is shown in class (on the board), but when we are done (after 5 or so steps) we have a table of points which looks like:

| t | y |
|---|---|
| 0 | 1 |
| 0.1 | 0.9 |
| 0.2 | 0.852967995 |
| 0.3 | 0.8374415 |
| 0.4 | 0.839833779 |
| 0.5 | 0.851677371 |

To check this result, you could use the analytical solution - or you could numerically integrate the ODE using Simulink. The simulink file is found [here](./Euler_Example/Euler_Example.slx) but looks like this and produces this result:

![Euler Result](./Euler_Example/Eulers_Method.png)

## Time Shifting using Laplace (2nd shifting theorem)

Consider a mass (1 kg) attached to a spring (k = 1 N/m) with a force applied to it f(t). The governing ordinary differential equation is:

```math
x'' + x = f(t) 
```

In the problem we cover in class, f(t) is a unit step force of 1N, activating at t = 1 and stopping at t = 5. We can write this as:

```math
f(t) = u(t-1) - u(t-5)
```

The analytical solution to this can be found using the 2nd shifting theorem (or the t-shifting theorem). The Laplace transform of the governing ODE can be shown to be:

```math
s^2X(s) + X(s) = (\frac{1}{s})(e^{-s} - e^{-5s})
```

which has the solution for X(s):

```math
X(s) = \frac{e^{-s}}{s(s^2+1)} - \frac{e^{-5s}}{s(s^2+1)}
```

The inverse Laplace transform (shown in class) gives the final answer:

```math
x(t)=(1-cos(t-1)u(t-1)) - (1-cos(t-5))u(t-5)
```

The MATLAB code to plot this function from the command line is:

```bash
t = 0.01:0.01:20;
u1 = (t > 1);
u2 = (t > 5);
x = (1 - cos(t-1)).*u1 - (1 - cos(t-5)).*u2;
plot(t, x)
```


We can check our answer using Simulink. The model for Simulink is shown below, and can be found [here](./Laplace_Time_Shift/Laplace_Time_Shift.slx).

![Time Shift](./Laplace_Time_Shift/Laplace_Time_Shift.png)

The comparison of the analytical solution is shown next to the result from simulink - again, showing that Simulink is a useful tool for quickly checking your analytical solutions.