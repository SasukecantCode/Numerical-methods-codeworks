% Q7: Approximate cube root of 25 by solving x^3 - 25 = 0 on [2,3] (tol 1e-4)
clc; clear;
f = @(x) x.^3 - 25;
a = 2; b = 3; tol = 1e-4; it = 0;
while (b-a)/2 > tol
    it = it + 1;
    p = (a+b)/2;
    if f(a)*f(p) < 0, b = p; else, a = p; end
end
p = (a+b)/2;
fprintf('cbrt(25) = %.6f, iters = %d, residual = %.2e\n', p, it, abs(f(p)));
