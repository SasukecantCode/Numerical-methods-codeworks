% Q13: All real zeros of x^2 + 10 cos x = 0 via fixed-point rearrangements
clc; clear;
f = @(x) x.^2 + 10*cos(x);
tol = 1e-9; maxit = 500;

g1 = @(x) acos(-x.^2/10);      
p = 2;
for k = 1:maxit, pn = g1(p); if abs(pn-p) < tol, break; end, p = pn; end
r1 = pn;

g2 = @(x) sqrt(-10*cos(x));    
p = 3;
for k = 1:maxit, pn = g2(p); if abs(pn-p) < tol, break; end, p = pn; end
r2 = pn;

fprintf('Real zeros: +/- %.5f  and  +/- %.5f\n', r1, r2);
fprintf('residuals: %.2e, %.2e\n', abs(f(r1)), abs(f(r2)));
