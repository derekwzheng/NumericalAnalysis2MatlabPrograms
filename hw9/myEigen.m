% It takes in a square matrix A and returns the vector of eigenvalues
% evals and the matrix of corresponding eigenvectors, evecs.
% Here is the algorithm: we first find an upper Hessenberg matrix that is
% similar to A. Second, apply shifted QR to the upper Hessenberg matrix to
% get all eigenvalues. Finally, we apply a step inverse power iteration to
% get all eigenvetors of A.
function [evals, evecs] = myEigen(A)
upperHess = upperHessen(A);
evals = shiftedQR(upperHess);
n = length(evals);
evecs = zeros(n);
for i = 1: n
    [tmp, evecs(:, i)] = invpowerit(A, randn(n, 1), evals(i), 1);
    evecs(:, i) = evecs(:, i) / norm(evecs(:, i));
end
evals = diag(evals);
end