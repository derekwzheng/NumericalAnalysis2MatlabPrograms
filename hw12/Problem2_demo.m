%% Problem2_demo
clear all;
close all;
clc;

NUMBER_OF_GRID_POINTS = 100;
e = ones(NUMBER_OF_GRID_POINTS - 1, 1);

%% (a) Lax-Wendroff
x = -1: 0.01: 1;
y = sqrt(1-x.^2);
hold on, plot(x, y,'r','LineWidth',2)
hold on, plot(x,-y,'r','LineWidth',2)
axis equal % this makes the circle look like a circle
title(['Eigenvalues on a Complex Plane of the Matrices A of the ', ...
     'Lax-Wendroff Scheme']);
xlabel('Re');
ylabel('Im');
for sigma = 0: 0.01: 2             % Note that 0 <= sigma <= 2
    A = (1 - sigma^2) * eye(NUMBER_OF_GRID_POINTS)...
        + (1 + sigma) / 2 * sigma * diag(e, -1)...
        + (sigma - 1) / 2 * sigma * diag(e, 1);
    evals = eig(A);
    [~, indexOfMax] = max(abs(evals));
    maxEval = evals(indexOfMax);
    hold on, plot(real(maxEval), imag(maxEval), 'b.', 'MarkerSize', 20)
end
%% (b) Lax-Friedrichs

clear all;
close all;
clc;

NUMBER_OF_GRID_POINTS = 100;
e = ones(NUMBER_OF_GRID_POINTS - 1, 1);

x = -1: 0.01: 1;
y = sqrt(1-x.^2);
hold on, plot(x, y,'r','LineWidth',2)
hold on, plot(x,-y,'r','LineWidth',2)
axis equal % this makes the circle look like a circle
title(['Eigenvalues on a Complex Plane of the Matrices A of the ',...
     'Lax-Friedrichs Scheme']);
xlabel('Re');
ylabel('Im');
 for sigma = 0: 0.01: 2             % Note that 0 <= sigma <= 2
    A = diag(0.5 * (1 + sigma) * e, -1) ...
        + diag(0.5 * (1 - sigma) * e, 1);
    evals = eig(A);
    [~, indexOfMax] = max(abs(evals));
    maxEval = evals(indexOfMax);
    hold on, plot(real(maxEval), imag(maxEval), 'b.', 'MarkerSize', 20)
end
%% (c) Crank-Nicolson
clear all;
close all;
clc;

NUMBER_OF_GRID_POINTS = 100;
E = ones(NUMBER_OF_GRID_POINTS, 1);
e = ones(NUMBER_OF_GRID_POINTS - 1, 1);

x = -1: 0.01: 1;
y = sqrt(1-x.^2);
hold on, plot(x, y,'r','LineWidth',2)
hold on, plot(x,-y,'r','LineWidth',2)
axis equal % this makes the circle look like a circle
title(['Eigenvalues on a Complex Plane of the Matrices A of the ',...
     'Crank-Nicolson Scheme']);
xlabel('Re');
ylabel('Im');
for sigma = 0: 0.01: 2             % Note that 0 <= sigma <= 2
    A = diag(-0.25 * sigma * e, -1) ...
        + eye(NUMBER_OF_GRID_POINTS) + diag(0.25 * sigma * e, 1);
    B = diag(0.25 * sigma * e, -1) ...
        + eye(NUMBER_OF_GRID_POINTS) + diag(-0.25 * sigma * e, 1);
    A = A \ B;
    evals = eig(A);
    [~, indexOfMax] = max(abs(evals));
    maxEval = evals(indexOfMax);
    hold on, plot(real(maxEval), imag(maxEval), 'b.', 'MarkerSize', 20)
end