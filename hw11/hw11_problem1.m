% hw 11 Problem 1
THRESHOLD = 1e-3;
MY_POSITION = 10;
% (a)
xl = 0;
xr = 11;
tb = 0;
tt = 24 * 60 * 60;
D = 4.2e-5; % The diffusion coefficient of smell in air 
h = 1e-3;
k = 24; % approximately equals 1e-3 / D;

referenceW = crankNicolson(xl, xr, tb, tt, h, k);
[m, n] = size(referenceW);
myPositionW = referenceW((m - 1) * 10 / 11 + 1, n);
display(myPositionW);
if myPositionW > THRESHOLD
    display('I can smell it!');
else
    display('Nope, I do not smell it.');
end

% (b)
% Keep the reference parameters h = 1e-3 and k = 24
newH = 0.01;
newK = 240;
w = crankNicolson(xl, xr, tb, tt, newH, newK);
[newM, newN] = size(w);

% Plot the solution after 24 hours
X = 0:h:xr;
plot(X, referenceW(:,end), 'r--');
xlabel('space x');
ylabel('level of smell');
title('Reference Approximate Solution After 24 Hours');
hold on;
plot(0:newH:xr, w(:, end), 'bo');
legend('reference', 'h=0.01, k = 240');

% Plot the time evolution of the smell at my seat; i.e., u(10, t);
T = 0:k:tt;
plot(T, referenceW((m - 1) * 10 / 11 + 1, :), 'r--');
xlabel('time t');
ylabel('level of smell');
title('Time Evolution of The Smell At My Seat');
hold on;
plot(0:newK:tt, w((newM - 1) * 10 / 11 + 1, :), 'bo');
legend('reference', 'h=0.01, k = 240');