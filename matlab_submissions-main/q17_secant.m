% Q17: Secant method for the four Q16 equations (interval endpoints as p0,p1)
clc; clear;
tol = 1e-4; maxit = 100;
cases = {
    @(x) x.^3 - 2*x.^2 - 5,     1,  4,    '17a';
    @(x) x.^3 + 3*x.^2 - 1,    -3, -2,    '17b';
    @(x) x - cos(x),            0,  pi/2, '17c';
    @(x) x - 0.8 - 0.2*sin(x),  0,  pi/2, '17d'};
for j = 1:size(cases,1)
    f = cases{j,1}; p0 = cases{j,2}; p1 = cases{j,3};
    f0 = f(p0); f1 = f(p1);
    for k = 1:maxit
        p = p1 - f1*(p1-p0)/(f1-f0);
        if abs(p - p1) < tol, break; end
        p0 = p1; f0 = f1; p1 = p; f1 = f(p);
    end
    fprintf('%-5s root = %.6f in %d iters, residual = %.2e\n', cases{j,4}, p, k, abs(f(p)));
end
