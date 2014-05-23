% MATH 128B Homework Set 3
% Demo
% 1.
display('This is the demo for question 1.');
n = 12;
[A, b] = sparsesetup(n);
initialGuess = rand(n, 1);
x = conGradMethod(A, b, initialGuess, 10e-6);
display(x);

% display('This is the demo for second part of question 1');
% n = 100000;
% [A, b] = sparsesetup(n);
% initialGuess = rand(n, 1);
% x = conGradMethod(A, b, initialGuess, 10e-6);
% display(x);