% demo of problem 2 of hw 11
% (a)
dt = 1e-2; t=0:dt:1;
dx = 1e-2; x=0:dx:1;
[X,T] = meshgrid(x,t);
ue = exp(-T).*sin(pi*X);
surf(X,T,ue)
colormap nicecolormap
shading interp
view([0 90])
set(gcf,'Color','w')
title('Exact solution')

% (b)
xl = 0;
xr = 1;
tb = 0;
tt = 1;
% h = 0.01;
% k = 0.01;
% w = backwardDifference(xl, xr, tb, tt, h, k);

% (c)
u = @(x, t) exp(-t) * sin(pi * x);
h = 0.1;
k = 0.1;
w = backwardDifference(xl, xr, tb, tt, h, k);
[m, n] = size(w);
error1 = abs(u(0.5, 1) - w((m + 1) / 2, n));

h = 0.01;
k = 0.01;
w = backwardDifference(xl, xr, tb, tt, h, k);
[m, n] = size(w);
error2 = abs(u(0.5, 1) - w((m + 1) / 2, n));
% 
h = 0.001;
k = 0.001;
w = backwardDifference(xl, xr, tb, tt, h, k);
[m, n] = size(w);
error3 = abs(u(0.5, 1) - w((m + 1) / 2, n));

display(error1);
display(error2);
display(error3);