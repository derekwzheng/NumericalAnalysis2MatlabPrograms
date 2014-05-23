% Input: space interval [xl, xr], time interval [tb, tt],
%        space step size h, and time step size k
% Output: solution w
function w = crankNicolson(xl, xr, tb,t t, h, k)
D = 4.2e-5;                                % diffusivity
M = (xr - xl) / h;
N = (tt - tb) / k;          
sigma= D * k / (h * h);
m = M - 1;
n = N;
e = ones(m, 1);
A = spdiags([-sigma*e 2*sigma*e -sigma*e], -1:1, m, m) + 2 * speye(m);
B = spdiags([sigma*e -2*sigma*e sigma*e], -1:1, m, m) + 2 * speye(m);
lside = l(tb + (0 : n) * k);
rside=r(tb + (0 : n) * k);
w(:, 1) = f(xl + (1 : m) * h)';              % initial conditions
for j = 1 : n
    sides = [lside(j) + lside(j + 1); zeros(m - 2, 1); ... 
        2 * h * (rside(j) + rside(j + 1))];
    w(:, j + 1) = A \ (B * w(:, j) + sigma * sides);
end
w = [lside; w; rside]; % But the rside is not right. Ignore it.
x = xl + (0 : M) * h;
t = tb + (0 : N) * k;
mesh(x, t, w');
xlabel('x');
ylabel('t');
axis([xl xr tb tt 0 2])

% The initial condition u(x, 0) = f(x)
function u = f(x)
u = exp(-x);

% The left boundary condition u(0, t) = l(t) = 1;
function u = l(t)
u = 0 * t + 1;

% The right boundary condition Ux(xr, t) = r(t) = 0
function u = r(t)
u = 0 * t;
