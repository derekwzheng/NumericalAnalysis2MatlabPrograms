function [U, S, V] = mySVD(A)
[m, n] = size(A);
ATA = A' * A;
%[matlabEvecs, matlabEvals]  = eig(ATA);
[evals, evecs] = myEigen(ATA);
V = evecs;
S = sqrt(evals);
U = (A * V) / S;
end