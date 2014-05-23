% hw9_demo
warning('off', 'all');

display('****************Our workhorse QR algorithm demo*************');
A = [7, -33, -15; 2, 26, 7; -4, -50, -13];
[matlabEvecs, matlabEvals]  = eig(A);
[myEvals, myEvecs] = myEigen(A); % Note that the A might get changed
display(matlabEvals);
display(matlabEvecs);
display(myEvals);
display(myEvecs);

display(' ');
display(' ');
display('********************My svd program demo********************');
A = [7, -33, -15; 2, 26, 7; -4, -50, -13];
[U, S, V] = svd(A);
[myU, myS, myV] = mySVD(A);
display(U);
display(S);
display(V);
display(myU);
display(myS);
display(myV);