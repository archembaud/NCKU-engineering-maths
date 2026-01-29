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
