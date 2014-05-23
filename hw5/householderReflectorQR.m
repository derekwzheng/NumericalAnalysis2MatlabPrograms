function [Q, R] = householderReflectorQR(A)
%  It takes in a m by n matrix A and returns Q and R of the full
%  QR-factorization of A, wehre Q is a m by m matrix and R is a m by n
%  upper-triangular matrix. Here, the implementation uses Householder
%  reflectors to find the Q.
%  @author Derek Zheng

[m, n] = size(A);
Q = zeros(m, m);
R = zeros(m, n);
x1 = A(:, 1);
w = zeros(m, 1);
w(1) = -sign(x1(1)) * norm(x1, 2);
v = w - x1;
H1 = eye(m) - 2 * (v * v') / (v' * v);
A = H1 * A;
Q = H1;
for jj = 2: n
    w = zeros(m - jj + 1, 1);
    w(1) = -sign(A(jj, jj)) * norm(A(:, jj), 2);
    x = A(jj: end, jj);
    v = w - x;
    H = eye(m);
    smallH = eye(m - jj + 1) - 2 * (v * v') / (v' * v);
    for i = 1 : m - jj + 1
        for j = 1 : m - jj + 1
            H(jj + i - 1, jj + j - 1) = smallH(i, j);
        end
    end
    A = H * A;
    Q = Q * H;
end
R = A;
end