function [result] = conGradMethod(A, b, guess, tolerance)
% Conjugate Gradient Method
%   This function takes in a coefficient matrix A, right-hand side B, an
%   initial guess GUESS, and a TOLERANCE, returns an improvement of the
%   solution RESULT.
TOLERANCE = tolerance;
x0 = guess;
tmp = size(A);
n = tmp(1);
r0 = b - A * x0;
d0 = r0;
x{1} = x0;
r{1} = r0;
d{1} = d0;
early = 0;
infNormRes = zeros(1, 1);
for k = 1 : n
    infNormRes(k) = norm(r{k}, inf);
    if (isequal(r{k}, zeros(n, 1)) || infNormRes(k) < TOLERANCE)
        early = 1;
        result = x{k};
        break;
    end
    alpha{k} = ((r{k})' * r{k}) / ((d{k})' * A * d{k});
    x{k + 1} = x{k} + alpha{k} * d{k};
    r{k + 1} = r{k} - alpha{k} * A * d{k};
    beta{k} = ((r{k + 1})' * r{k + 1}) / ((r{k})' * r{k});
    d{k + 1} = r{k + 1} + beta{k} * d{k};
end
if (~early)
    result = x {n + 1};
end
temp = size(infNormRes);
num = temp(2);
plot(1:num, infNormRes);
end

