%HW 5 Demo
%Problem 2
%(c)
v = linspace(2, 4, 11);
y = @(x) 1 + x + x^2 + x^3 + x^4 + x^5 + x^6 + x^7;
A = zeros(11, 8);
b = zeros(11, 1);
for i = 1 : 11
    b(i) = y(v(i));
end
for i = 1 : 11
    for j = 1 : 8
        A(i, j) = v(i) ^ (j - 1);
    end
end
xMatlab = ((A' * A) \ (A' * b))';
display(A);
display(b);
display('Here is the QR-factorization by Gram-Schmidt process');
[Q, R] = gramSchmidtQR(A);
display(Q);
display(R);
GSx = leastSquare(Q, R, b);
display('Here is the QR-factorization by Householder Reflectors.');
[Q, R] = householderReflectorQR(A);
display(Q);
display(R);
HRx = leastSquare(Q, R, b);

display('---------------------------Summary--------------------------');
display('1) The solution by Gram-Schmidt QR-factorization:');
display(GSx);
display('2) The solution by Householder reflector QR-factorization:');
display(HRx);
display('3) The solution of the normal equation by Matlab command \:');
display(xMatlab);
display('4) The exact solution:');
exactSol = ones(1, 8);
display(exactSol);