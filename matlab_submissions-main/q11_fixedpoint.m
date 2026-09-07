% Q11: Approximate sqrt(3) via g(x) = 0.5*(x + 3/x), p0 = 1 (tol 1e-4)
clc; clear;
g = @(x) 0.5*(x + 3./x);
p = 1; tol = 1e-4; maxit = 100;
for k = 1:maxit
    pnew = g(p);
    fprintf('p%d = %.6f\n', k, pnew);
    if abs(pnew - p) < tol, break; end
    p = pnew;
end
fprintf('sqrt(3) approx = %.6f in %d iterations\n', pnew, k);
