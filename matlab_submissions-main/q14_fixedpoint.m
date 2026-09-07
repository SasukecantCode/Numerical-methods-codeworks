% Q14: Fixed-point iteration for 2 sin(pi x) + x = 0 on [1,2], p0 = 1
clc; clear;
g = @(x) 2 - asin(x/2)/pi;
f = @(x) 2*sin(pi*x) + x;
p = 1; tol = 1e-4; maxit = 200;
for k = 1:maxit
    pnew = g(p);
    if abs(pnew - p) < tol, break; end
    p = pnew;
end
fprintf('Root = %.6f in %d iters, residual = %.2e\n', pnew, k, abs(f(pnew)));
