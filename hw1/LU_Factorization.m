function [L, U] = LU_Factorization(A)
% LU_Factoriztion takes a square matrix A, applies the LU Decomposition
% on it, and print out the lower-triangular matrix L and upper-triangular
% matrix U.
% Note: This program does not allow row exchange operations, so it shuts
%       down if it encounters a zero pivot.

[nrow, ncol] = size(A);
if (nrow ~= ncol)
    error('Wrong input matrix A');
end
L = eye(nrow);
for j = 1 : ncol - 1
    if abs(A(j, j)) < eps
        error('zero pivot encountered');
    end
    for i = j + 1 : nrow
        mult = A(i, j) / A(j, j);
        for k = j : ncol
            A(i, k) = A(i, k) - mult * A(j, k);
        end
        L(i, j) = mult;
    end
end
    U = A;
end

