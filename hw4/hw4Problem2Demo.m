% MATH 128B Homework Set 4
% Demo
% @author Derek Zheng
% Sec 2.5 Exercise 5

n = 100;
[A, b] = HW4sparsesetup(n);
initialGuess = zeros(n, 1);
OMEGA = 1.2;

display('This is the demo for question (a).');
[x, gsIter, gsRes] = gaussSeidelMethod(A, b, initialGuess, 1e-3);
display(x);

display('This is the demo for question (b).');
[y, SORIter, SORRes] = SORMethod(A, b, initialGuess, 1e-3, OMEGA);
display(y);

figure
plot(1: gsIter, gsRes, 'r');
hold all
plot(1: SORIter, SORRes, '--bo');
title('Infinity Norm of Residual v.s. Number of Iterations (n = 100)');
xlabel('k = number of iterations');
ylabel('||r||_{\infty} = infinity norm of residual');
hleg = legend('Gauss-Seidel method', 'SOR with OMEGA = 1.2');