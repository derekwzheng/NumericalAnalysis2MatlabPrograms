function [x] = leastSquare(Q, R, b)
% Returns the least square solution of the  m by n system Ax = b. It takes
% in Q and R which the the QR factorization of A, so A = Q * R.
% @author Derek Zheng
[m, n] = size(R);
upperR = R(1:n, 1:n);
d = Q' * b;
upperD = d(1:n, :);
x = upperR \ upperD;
x = x';
end

