% It takes a square matrix A, and turns it into a upper Hessenberg form by
% Householder reflectors. It returns A and reflectors v. Note that [a, v] =
% upperHessen(a) returns the similar matrix a of Hessenberg form and a
% matrix v whose columns are the v's defining the Householder reflectors.
function [a, v] = upperHessen(a)
[m, n] = size(a);
v = zeros(m, m);
for k = 1: m - 2
  x = a(k + 1 : m, k);
  v(1 : m - k, k) = -sign(x(1) + eps) * norm(x) * eye(m - k, 1) - x;
  v(1 : m - k, k) = v(1: m - k, k) / norm(v(1 : m - k, k));
  a(k + 1 : m, k : m) = a(k + 1 : m, k : m) - ...
      2 * v(1 : m - k, k) * v(1 : m - k, k)' * a(k + 1 : m, k : m);
  a(1 : m, k + 1 : m) = a(1 : m, k + 1 : m) ...
      - 2 * a(:,k + 1 : m) * v(1 : m - k, k) * v(1 : m - k, k)';
end