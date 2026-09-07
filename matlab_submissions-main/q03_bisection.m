% Q3: Bisection to 1e-5 for several equations / intervals
clc; clear;
tol = 1e-5;
cases = {
    @(x) x - 2.^(-x),                  0,   1,   '3a';
    @(x) exp(x) - x.^2 + 3*x - 2,      0,   1,   '3b';
    @(x) 2*x.*cos(2*x) - (x+1).^2,    -3,  -2,   '3c-i';
    @(x) 2*x.*cos(2*x) - (x+1).^2,    -1,   0,   '3c-ii';
    @(x) x.*cos(x) - 2*x.^2 + 3*x - 1, 0.2, 0.3, '3d-i';
    @(x) x.*cos(x) - 2*x.^2 + 3*x - 1, 1.2, 1.3, '3d-ii'};
for j = 1:size(cases,1)
    f = cases{j,1}; a = cases{j,2}; b = cases{j,3};
    while (b-a)/2 > tol
        p = (a+b)/2;
        if f(a)*f(p) < 0, b = p; else, a = p; end
    end
    p = (a+b)/2;
    fprintf('%-7s root = %.6f  residual = %.2e\n', cases{j,4}, p, abs(f(p)));
end
