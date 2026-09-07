% Q16: Newton's method (tol 1e-4) for four equations
clc; clear;
tol = 1e-4; maxit = 100;
cases = {
    @(x) x.^3 - 2*x.^2 - 5,    @(x) 3*x.^2 - 4*x,     2.5,  '16a';
    @(x) x.^3 + 3*x.^2 - 1,    @(x) 3*x.^2 + 6*x,    -2.5,  '16b';
    @(x) x - cos(x),           @(x) 1 + sin(x),       pi/4, '16c';
    @(x) x - 0.8 - 0.2*sin(x), @(x) 1 - 0.2*cos(x),   pi/4, '16d'};
for j = 1:size(cases,1)
    f = cases{j,1}; df = cases{j,2}; p = cases{j,3};
    for k = 1:maxit
        pnew = p - f(p)/df(p);
        if abs(pnew - p) < tol, break; end
        p = pnew;
    end
    fprintf('%-5s root = %.6f in %d iters, residual = %.2e\n', cases{j,4}, pnew, k, abs(f(pnew)));
end
