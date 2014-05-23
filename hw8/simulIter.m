% It takes in a square matrix A and number of step of K, and it computes
% eigenvalues/eigenvectors of A.
% Returns eigenvalues lam and eigenvector matrix Q.
function [lam, Q] = simulIter(A, k)
[m, n] = size(A);
Q = eye(m, m);
for j = 1: k
    [Q, R] = qr(A * Q);
end
lam = diag(Q' * A * Q);