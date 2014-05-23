% Program Sparse matrix setup for HW4
% Input: n = size of system
% Outputs: sparse matrix a, r.h.s. b
function [a,b] = HW4sparsesetup(n)
e = ones(n,1);
n2=n/2;
a = spdiags([-e 3*e -e],-1:1,n,n);    % Entries of a
b=zeros(n,1);                         % Entries of r.h.s. b
b(1)=2;b(n)=2;b(2:n-1)=1;