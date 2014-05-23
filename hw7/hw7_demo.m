% hw7 demo
A = [7, -33, -15; 2, 26, 7; -4, -50, -13];

NUM_ITERATIONS0 = 100000;
SHIFTING = 2;
[leadingLam, leadingV] = powIteration(A, NUM_ITERATIONS0);
display(leadingLam);
display(leadingV);

[smallestLam, smallestV] = invPowIter(A, SHIFTING, NUM_ITERATIONS0);
display(smallestLam);
display(smallestV);

NUM_ITERATIONS1 = 7;
vector = rand(3, 1);
[rqiLam, rqiV] = rayleighQuoIter(A, NUM_ITERATIONS1);
display(rqiLam);
display(rqiV);

% This is the correct eiganvalues of A, computed by MatLab command eig.
correctEiganvalues = eig(A);
display(correctEiganvalues);