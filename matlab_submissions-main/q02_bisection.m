% Q2: Bisection for x^3 - 7x^2 + 14x - 6 = 0 on three intervals (tol 1e-2)
clc; clear;
f = @(x) x.^3 - 7*x.^2 + 14*x - 6;
brackets = [0 1; 1 3.2; 3.2 4];
tol = 1e-2;
for j = 1:size(brackets,1)
    a = brackets(j,1); b = brackets(j,2); it = 0;
    while (b-a)/2 > tol
        it = it + 1;
        p = (a+b)/2;
        if f(a)*f(p) < 0, b = p; else, a = p; end
    end
    p = (a+b)/2;
    fprintf('[%.1f,%.1f]: root = %.6f, iters = %d, residual = %.2e\n', ...
        brackets(j,1), brackets(j,2), p, it, abs(f(p)));
end
