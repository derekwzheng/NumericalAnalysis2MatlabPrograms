% MATH 128B Homework Set 4
% Demo
% @author Derek Zheng
% 1.
n = 100000;
[A, b] = HW4sparsesetup(n);
initialGuess = zeros(n, 1);

display('This is the demo for question 1(a).');
[x, jIter, jRes] = jacobiMethod(A, b, initialGuess, 1e-3);
display(x);

display('This is the demo for question 1(b).');
[y, gsIter, gsRes] = gaussSeidelMethod(A, b, initialGuess, 1e-3);
display(y);

display('This is the demo for question 1(c)');
[z, cgIter, cgRes] = conGradMethod(A, b, initialGuess, 1e-3);
display(z);

figure
plot(1: jIter, jRes, 'r');
hold all
plot(1: gsIter, gsRes, '--bo');
hold all
plot(1: cgIter, cgRes, ':g*');
title('Infinity Norm of Residual v.s. Number of Iterations');
xlabel('k = number of iterations');
ylabel('||r||_{\infty} = infinity norm of residual');
hleg = legend('Jacobi method', 'Gauss Seidel method',...
    'Conjugate Gradient method');