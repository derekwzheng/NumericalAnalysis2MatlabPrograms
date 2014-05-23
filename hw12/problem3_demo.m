% Problem 3 demo
%% (a) Plot the solution
clear all;
close all;
clc;

dt = 1e-2;
t = 0:dt:2;
dx = 1e-2;
x = 0:dx:1;
[X,T] = meshgrid(x,t);
ue = sin(pi * X).*sin(2 * pi * T);
surf(X, T, ue)
colormap nicecolormap
shading interp
view([0 90])
set(gcf,'Color','w')
title('Exact solution')

%% (b) Solve the wave equation using the Leap-Frog scheme with h = 0.1,
%      k = h / c. Then plot the numerical solution and compare it with
%      the exact solution
clear all;
close all;
clc;

C = 2;  % a coefficient of the wave equation Utt = C^2 * Uxx.
T = 2;  % the right endpoint of the time interval; i.e., 0 <= t <= T.
h = 0.1;
k = h / C;
sigma = C * k / h;
x = h: h: 1 - h;
t = 0: k: T;
Nx = length(x);
Nk = T / k;
e = ones(Nx, 1);
A = spdiags([sigma^2 * e, 2 * (1 - sigma^2) * e, sigma^2 * e], -1:1,...
    Nx, Nx);
w = zeros(Nx, Nx);
w(:, 1) = zeros(Nx, 1); % initial condition
w(:, 2) = 0.5 * A * w(:, 1) + (k * 2 * pi * sin(pi * x))';
for kk = 3 : Nk
    w(:, kk) = A * w(:, kk - 1) - w(:, kk - 2);
end
w(:, end + 1) = zeros(Nx, 1); 

[X,T] = meshgrid(x, t);
surf(X, T, w');
colormap nicecolormap;
shading interp;
view([0 90]);
set(gcf,'Color','w');
title('Approximate solution with h = 0.1');

%% (c) Solve the wave equation numerically with h = 0.1, 0.01, and 0.001
%      and compute the error at x = 0.5 and t = 1.5.
format long e;
C = 2;
T = 2;
u = @(x, t) sin(pi * x) * sin(2 * pi * t);
h1 = h;
error1 = abs(w(0.5 * (Nx + 1), (1.5 / 2) * Nk) - u(0.5, 1.5));

h2 = 0.01;
k2 = h2 / C;
sigma = C * k2 / h2;
x = h2: h2: 1 - h2;
t = 0: k2: T;
Nx = length(x);
Nk = T / k2;
e = ones(Nx, 1);
A = spdiags([sigma^2 * e, 2 * (1 - sigma^2) * e, sigma^2 * e], -1:1,...
    Nx, Nx);
w = zeros(Nx, Nx);
w(:, 1) = zeros(Nx, 1); % initial condition
w(:, 2) = 0.5 * A * w(:, 1) + (k2 * 2 * pi * sin(pi * x))';
for kk = 3 : Nk
    w(:, kk) = A * w(:, kk - 1) - w(:, kk - 2);
end
w(:, end + 1) = zeros(Nx, 1);
error2 = abs(w(0.5 * (Nx + 1), (1.5 / 2) * Nk) - u(0.5, 1.5));

h3 = 0.001;
k3 = h3 / C;
sigma = C * k3 / h3;
x = h3: h3: 1 - h3;
t = 0: k3: T;
Nx = length(x);
Nk = T / k3;
e = ones(Nx, 1);
A = spdiags([sigma^2 * e, 2 * (1 - sigma^2) * e, sigma^2 * e], -1:1,...
    Nx, Nx);
w = zeros(Nx, Nx);
w(:, 1) = zeros(Nx, 1); % initial condition
w(:, 2) = 0.5 * A * w(:, 1) + (k2 * 2 * pi * sin(pi * x))';
for kk = 3 : Nk
    w(:, kk) = A * w(:, kk - 1) - w(:, kk - 2);
end
w(:, end + 1) = zeros(Nx, 1);
error3 = abs(w(0.5 * (Nx + 1), (1.5 / 2) * Nk) - u(0.5, 1.5));

display(error1);
display(error2);
display(error3);

hs = [h3, h2, h1];
errors = [error3, error2, error1];
loglog(hs, errors);
title('Error as a Function of h on a Logarithmic Scale');
xlabel('h');
ylabel('error');

leftSlope = (error2 - error3) / (h2 - h3);
rightSlope = (error1 - error2) / (h1 - h2);
display(leftSlope);
display(rightSlope);