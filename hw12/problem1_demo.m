%%
%% MAIN PROGRAM
%%
clear all
close all
clc

%% Nice Colors for plots
%% .......................................................................
Color  = zeros(3,5);
Color(:,1) = [85;170;170]/255;
Color(:,2) = [60;60;230]/255;
Color(:,3) = [170;0;170]/255;
Color(:,4) = [200;0;0]/255;
Color(:,5) = [0;70;0]/255;
%% .......................................................................

a = 1;

h = 0.1;
k = 0.1;
x = (-10:h:20)';

f = exp(-x.^2/2) / sqrt(2 * pi);
figure
plot(x, f, '--', 'Color', Color(:,1), 'LineWidth', 2);
set(gcf, 'Color', 'w');

f10 = exp(-(x - a * 10).^2 / 2) / sqrt(2 * pi); % Exact solution at t = 10
hold on, plot(x, f10, 'Color', Color(:, 2), 'LineWidth', 2);
%% Crank-Nicolson
u = CN_BabyWave(h,k,a,x,f,10);
% figure(1)
hold on, plot(x,u,'o', 'Color', Color(:,4), 'LineWidth', 2)
set(gcf,'Color','w')
xlabel('space x');
ylabel('u(x, t) for fixed t');
title('Exact Solution v.s. CN\_Approximation');
legend('Initial condition', 'Exact solution at t = 10', ...
       'approximate Solution at t = 10');
%% Problem1b
% Repeat the simulation with h = k = 0.1, 0.01, and 0.001. Compute the
% error.
close all;
error1 = norm(f10 - u, 2);
h2 = 0.01;
k2 = 0.01;
u = CN_BabyWave(h2, k2, a, x, f, 10);
error2 = norm(f10 - u, 2);
h3 = 0.001;
k3 = 0.001;
u = CN_BabyWave(h3, k3, a, x, f, 10);
error3 = norm(f10 - u, 2);
hs = [h3, h2, h];
loglog(hs, [error3, error2, error1]);
xlabel('Space step size h (Note: h = k)');
ylabel('Error');
title('Error e(10, h, k) = ||f(x - 10) - w(x, 10, h, k)||_2 vs h');

display(error1);
display(error2);
display(error3);
leftSlope = (error2 - error3) / (h2 - h3);
rightSlope = (error1 - error2) / (h - h2);
display(leftSlope);
display(rightSlope);
%% Problem1c
close all;

a = 1;
h = 0.1;
k = 0.09;
x = (-10:h:20)';

f = exp(-x.^2/2) / sqrt(2 * pi);
figure
plot(x, f, '--', 'Color', Color(:,1), 'LineWidth', 2);
set(gcf, 'Color', 'w');

f10 = exp(-(x - a * 10).^2 / 2) / sqrt(2 * pi); % Exact solution at t = 10
hold on, plot(x, f10, 'Color', Color(:, 2), 'LineWidth', 2);
% Lax-Friedrichs Scheme
u = LF_BabyWave(h, k, a, x, f, 10);
hold on, plot(x,u,'o', 'Color', Color(:,4), 'LineWidth', 2)
set(gcf,'Color','w')
title('Exact Solution v.s. LF\_Approximation');
xlabel('space x');
ylabel('u(x, t) for fixed t');
legend('Initial condition', 'Exact solution at t = 10', ...
       'approximate Solution at t = 10');