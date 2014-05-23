function [lam, x] = rayleighQuoIter(A, k)
% Rayleigh Quotient Iteration
% It takes in a matrix A and number of steps k,
% and returns eigenvalue lam and eigenvector x
[m, n] = size(A);
x = rand(n, 1);
for j=1:k
  u = x / norm(x);              % normalize
  lam = u' * A * u;               % Rayleigh quotient
  x = (A - lam * eye(size(A))) \ u; % inverse power iteration
end
x = x / norm(x);
lam = x'*A*x;                 % Rayleigh quotient