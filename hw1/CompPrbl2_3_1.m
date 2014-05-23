function [condA, normForwardError, errorMF] = CompPrbl2_3_1(n)
% This function is a solution to the Computer Problems 2.3.1.

A = zeros(n);
for i = 1 : n
    for j = 1 : n
        A(i, j) = 5 / (i + 2 * j - 1);
    end
end

condA = norm(A, inf) * norm(inv(A), inf);

x = ones(n, 1);
b = A * x;
xc = A\b;

normX = max(x);
forwardError = x - xc;
normForwardError = max(forwardError);
relForwardError = normForwardError / normX;

residual = b - A * xc;
normResidual = max(residual);
normB = max(b);
relBackwardError = normResidual / normB;

errorMF = relForwardError / relBackwardError;
end
