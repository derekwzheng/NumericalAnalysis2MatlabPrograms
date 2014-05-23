% It returns the matrix of approximate solution w of the heat equation by
% backward difference method. It takes in the x boundaries [XL, XR], t
% boundaries [TB, TT], space step size H, and time step size K.
% The heat equation problem is Ut = D * Uxx.
% @author Derek Zheng
function w = backwardDifference(xl, xr, tb, tt, h, k)
% Diffusivity coefficient %
D = 1;
% function handlers %
% initial condition u(x, 0) = f(x)
f = @(x) sin(pi * x);
% boundary conditions u(0, t) = u(1, t) = 0 for 0 <= t <= 1
l = @(t) 0 * t;
r = @(t) 0 * t;
M = (xr - xl) / h;
N = (tt - tb) / k;
m = M - 1;
n = N;
sigma = D * k / (h * h);
e = ones(m ,1);
A = spdiags([-sigma*e 2*sigma*e -sigma*e], -1:1, m, m) + speye(m);
lside = l(tb + (0:n) * k);
rside = r(tb + (0:n) * k);
w(:, 1) = f(xl + (1 : m) * h)';
for j = 1: n
    w(:, j + 1) = A \ (w(:, j) + sigma * ...
        [lside(j); zeros(m - 2, 1); rside(j)]);
end
w = [lside; w; rside];
x = (0 : m + 1) * h;
t = (0 : n) * k;
% 3D plot
% mesh(x, t, w');
% view([0, 90]);
% axis([xl xr tb tt 0 1]);

% 2D plot
[X,T] = meshgrid(x, t);
surf(X, T, w');
colormap nicecolormap;
shading interp;
view([0 90]);
set(gcf,'Color','w');
title('Approximate solution');
end
