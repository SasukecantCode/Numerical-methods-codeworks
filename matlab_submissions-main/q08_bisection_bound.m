% Q8: Iteration bound and root of x^3 - x - 1 = 0 on [1,2] (tol 1e-5)
clc; clear;
f = @(x) x.^3 - x - 1;
a = 1; b = 2; tol = 1e-5;
n = ceil(log2((b-a)/tol));           % standard bound |p_n - p| <= (b-a)/2^n
fprintf('Required iterations n >= %d\n', n);
for k = 1:n
    p = (a+b)/2;
    if f(a)*f(p) < 0, b = p; else, a = p; end
end
fprintf('Root = %.6f, residual = %.2e\n', p, abs(f(p)));
