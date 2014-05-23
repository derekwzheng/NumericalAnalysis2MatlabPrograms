function [lam, u] = invPowIter(A, s, k)
% It takes in the n-by-n matrix A, an n-by-1 vector x, shift s, and number
% of steps k. After running the Inverse Power Iteration algorithm, it
% returns the dominant eiganvalues lam and eiganvector of inv(A-sI).
[m, n] = size(A);
x = rand(n, 1);
As = A - s * eye(m, n);
for j = 1 : k
    u = x / norm(x);
    x = As \ u;
    lam = u' * x;
end
lam = 1 / lam + s;
u = x / norm(x);
end

