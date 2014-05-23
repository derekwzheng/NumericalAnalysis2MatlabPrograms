% LW_BabyWave solves the baby wave equation Ut + aUx = 0 by Lax-Friedrichs
% scheme.
% It takes in the space step size H, time step size K, and constant A of
% the equation above, the interval of space x with step size H, X, the initial
% condition f applying to X, and the final time T. It returns an
% approximate solution in the form of matrix u.
function u = LW_BabyWave(h, k, a, x, f, T)
Nk = T / k;
Nx = length(x);
sigma = a * k / h;
e = ones(Nx, 1);
A = spdiags([0.5 * sigma * (1 + sigma) * e, (1 + sigma^2) * e, ...
    0.5 * sigma * (1 - sigma) * e], -1 : 1, Nx, Nx);
u = f;
for kk = 1 : Nk
    u = A * u;
end
end