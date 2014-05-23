% Computes eigenvalue of square matrix nearest to input s
% Input: matrix A, (nonzero) vector x, shift s, steps k
% Output: dominant eigenvector of inv(A-sI), eigenvalue lam
function [lam, x] = invpowerit(A, x, s, k)
As = A - s * eye(size(A));
for j = 1 : k
  u = x / norm(x);               % normalize
  x = As \ u;                    % inverse power step
  lam = u' * x;                  % Rayleigh quotient approximation
end
lam = 1 / lam + s;