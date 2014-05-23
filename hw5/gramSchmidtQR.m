function [Q, R] = gramSchmidtQR(A)
%  It takes in a m by n matrix A and returns Q and R of the full
%  QR-factorization of A, wehre Q is a m by m matrix and R is a m by n
%  upper-triangular matrix. Here, the implementation uses the classical
%  Gram-Schmidt process to find the Q.
%  @author Derek Zheng

[m, n] = size(A);
Q = zeros(m, m);
R = zeros(m, n);
for col = n + 1: m
    y = zeros(m, 1);
    y(m - col + 1) = 1;
    A(:, col) = y;
end
for j = 1 : m
    y = A(:, j);
    for i = 1 : j - 1
        R(i, j) = Q(:,i)' * A(:,j);
        y = y - R(i, j) * Q(:,i);
    end    
    R(j, j) = norm(y, 2);
    Q(:, j) = y / R(j, j);
end
R = R(1:n, 1:n);
for row = n + 1 : m
    R(row,:) = zeros(1, n);
end

