function [lam, x] = powIteration(A, k)
% It takes in an n-by-n matrix A and number of steps k, returns the leading
% eiganvalue and corresponding eiganvector of A by using power iteration.

% if we use while loop, we can propose the tolerance TOL = 10E-12
[m, n] = size(A);
x = rand(n, 1);
for j = 1 : k
    u = x / norm(x);
    x = A * u;
    lam = u' * x;
end
u = x / norm(x);
end

