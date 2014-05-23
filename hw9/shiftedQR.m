% It takes in a square matrix A and returns the vector lam which consists
% of all eigenvalues of A.
function lam = shiftedQR(A)
TOL = 1e-14;
m = size(A, 1);
lam = zeros(m, 1);
n = m;
while n > 1
    while max(abs(A(n, 1:n-1))) > TOL
        mu = A(n, n);      % define shift mu
        [q, r] = qr(A - mu * eye(n));
        A = r * q + mu * eye(n);
    end
    lam(n) = A(n, n);   % declare eigenvalue
    n = n - 1;              % decrement n
    A = A(1 : n, 1 : n);       % deflate
end
lam(1) = A(1, 1);       % 1x1 matrix remains