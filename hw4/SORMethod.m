function [result, k, infNormRes]=SORMethod(A, b, guess, tolerance, omega)
% The program uses Gauss-Seidel method to solve Ax = b by taking in a
% coefficient matrix A, right-hand-side vector B, an initial guess GUESS,
% a TOLERANCE as the stopping criterion, and parameter OMEGA.
% Here, we decompose A as L + D + U, where L is a lower-triangular matrix,
% D is a diagonal matrix, and U is an upper-triangular matrix.
TOLERANCE = tolerance;
OMEGA = omega;
x0 = guess;
iterSol{1} = x0;
U = triu(A, 1);
L = tril(A, -1);
D = diag(diag(A));
DInv = inv(D);
r0 = b - A * x0;
r{1} = r0;
k = 1;
infNormRes = zeros(1, 1);
infNormRes(k) = norm(r{k}, inf);
while (infNormRes(k) >= TOLERANCE)
    iterSol{k + 1} = inv(OMEGA * L + D) * ((1 - OMEGA) * D * iterSol{k}...
        - OMEGA * U * iterSol{k}) + OMEGA * inv(D + OMEGA * L) * b;
    r{k + 1} = b - A * iterSol{k + 1};
    infNormRes(k + 1) = norm(r{k + 1}, inf);
    k = k + 1;
end
result = iterSol{k};
%  plot(1 : k, infNormRes);
end