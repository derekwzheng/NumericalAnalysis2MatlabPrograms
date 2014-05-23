function [resultA, resultB] = naiveGE(A, b)
% naiveGE takes A, an n by n matrix and B, an n by 1 matrix, and returns
% the upper-triangular matrix and B by naive Gaussian Elimination.

[numRows, numCols] = size(A);
if (numRows ~= numCols)
    error('Wrong input matrix A');
end
for j = 1 : numCols - 1
    if abs(A(j, j)) < eps
        error('zero pivot encountered');
    end
    for i = j + 1 : numRows
        mult = A(i, j) / A(j, j);
        for k = j : numCols
            A(i, k) = A(i, k) - mult * A(j, k);
        end
        b(i) = b(i) - mult * b(j);
    end
end
    resultA = A;
    resultB = b;
end

