%% Crank-Nicolson
function u = CN_BabyWave(h, k, a, x, f, T)

Nk = T / k;
Nx = length(x);
s = a * k / h;
e = ones(Nx, 1);
A = spdiags([-0.25*s*e e 0.25*s*e], -1:1, Nx, Nx);
B = spdiags([0.25*s*e e -0.25*s*e], -1:1, Nx, Nx);
u = f;
% figure    % for animation
% set(gcf, 'Color', 'w')  % for animation
for kk = 1: Nk
    u = A \ (B * u);
    % Animation part. Uncomment the following if we want to see the
    % animation
%     plot(x,u,'LineWidth',2)
%     axis([-10 20 0 .5])
%     drawnow
end