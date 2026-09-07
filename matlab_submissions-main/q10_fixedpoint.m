% Q10: Fixed point of g(x) = pi + 0.5 sin(x/2) on [0,2pi] (tol 1e-2)
clc; clear;
g = @(x) pi + 0.5*sin(x/2);
p = pi; tol = 1e-2; maxit = 100;
for k = 1:maxit
    pnew = g(p);
    if abs(pnew - p) < tol, break; end
    p = pnew;
end
fprintf('Contraction bound |g''| <= 0.25; fixed point = %.6f in %d iters\n', pnew, k);
