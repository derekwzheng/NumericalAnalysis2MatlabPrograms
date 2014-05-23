function solution = linearSystemSolver(A, b)
% Solve the linear system Ax = b by LU decomposition and two-step back
% substitution.

[L, U] = LU_Factorization(A);
sz = size(b);
n = sz(1);

c = zeros(n, 1);
for i = 1 : n
    sum = 0;
    for k = 1 : i - 1
        sum = sum + L(i, k) * c(k);
    end
    c(i) = b(i) - sum;
end

solution = zeros(n, 1);
for i = n : -1 : 1
    sum = 0;
    for k = i + 1 : n
        sum = sum + U(i, k) * solution(k);
    end
    solution(i) = (c(i) - sum) / U(i, i);
end
end

