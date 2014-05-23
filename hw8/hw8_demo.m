% HW 8 demo
NUMBER_OF_STEPS = 100;
A = [7, -33,  -15; 2, 26, 7; -4, -50, -13];

[simulLam, simulQ] = simulIter(A, NUMBER_OF_STEPS);
[qrLam, qrQ] = pureQR(A, NUMBER_OF_STEPS);

display(simulLam);
display(simulQ);
display(qrLam);
display(qrQ);
display(eig(A));