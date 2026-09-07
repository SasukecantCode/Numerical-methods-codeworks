% Q9: Fixed-point iteration for x^4 - 3x^2 - 3 = 0, g(x) = (3x^2+3)^(1/4)
clc; clear;
g = @(x) (3*x.^2 + 3).^(1/4);
f = @(x) x.^4 - 3*x.^2 - 3;
p = 1; tol = 1e-5; maxit = 100;
for k = 1:maxit
    pnew = g(p);
    if abs(pnew - p) < tol, break; end
    p = pnew;
end
fprintf('Root = %.6f in %d iterations, residual = %.2e\n', pnew, k, abs(f(pnew)));
