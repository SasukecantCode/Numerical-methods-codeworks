% Q18: False-position method for the four Q16 equations (tol 1e-4)
clc; clear;
tol = 1e-4; maxit = 200;
cases = {
    @(x) x.^3 - 2*x.^2 - 5,     1,  4,    '18a';
    @(x) x.^3 + 3*x.^2 - 1,    -3, -2,    '18b';
    @(x) x - cos(x),            0,  pi/2, '18c';
    @(x) x - 0.8 - 0.2*sin(x),  0,  pi/2, '18d'};
for j = 1:size(cases,1)
    f = cases{j,1}; a = cases{j,2}; b = cases{j,3};
    fa = f(a); fb = f(b); pold = NaN; p = a;
    for k = 1:maxit
        p = b - fb*(b-a)/(fb-fa); fp = f(p);
        if fp == 0 || (~isnan(pold) && abs(p-pold) < tol), break; end
        if fa*fp < 0, b = p; fb = fp; else, a = p; fa = fp; end
        pold = p;
    end
    fprintf('%-5s root = %.6f in %d iters, residual = %.2e\n', cases{j,4}, p, k, abs(f(p)));
end
