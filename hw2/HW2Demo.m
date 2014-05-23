% Demo for HW2
A = [10e-15, 1; 1, 1];
b = [1; 1];
approx = linearSystemSolver(A, b)
[L, U] = LU_Factorization(A)
condA = cond(A, inf)
trueSoln = A\b
PP_A = [1, 1; 10e-15, 1]; % new A after partial pivoting
[l, u] = lu(PP_A)
