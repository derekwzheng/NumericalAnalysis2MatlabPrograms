% Pure QR Algorithm
% It takes in a square matrix A and number of steps K, computes
% eigenvalues/vectors of symmetric matrix A, and returns eigenvalues lam
% and eigenvector matrix Qbar.
function [lam, Qbar] = pureQR(A, k)
[m, n]=size(A);
Q = eye(m,m);
Qbar = Q;
R = A;
for j = 1 : k
  [Q, R] = qr(R * Q);
  Qbar = Qbar * Q;
end
lam = diag(R * Q);              % diagonal converges to eigenvalues
