% Q21: Zeros of f(x) = ln(x^2+1) - e^(0.4x) cos(pi x)
clc; clear;
f  = @(x) log(x.^2 + 1) - exp(0.4*x).*cos(pi*x);
df = @(x) 2*x./(x.^2+1) - exp(0.4*x).*(0.4*cos(pi*x) - pi*sin(pi*x));
tol = 1e-8; maxit = 100;

rn = run_newton(f, df, -0.5, tol, maxit);
fprintf('Negative zero: %.6f\n', rn);

roots = zeros(1,25);
for k = 1:25
    roots(k) = run_newton(f, df, k - 0.5, tol, maxit);
end
fprintf('First four positive zeros: %.6f %.6f %.6f %.6f\n', roots(1:4));
fprintf('25th positive zero: %.6f\n', roots(25));

function r = run_newton(f, df, p, tol, maxit)
    for k = 1:maxit
        pn = p - f(p)/df(p);
        if abs(pn - p) < tol, break; end
        p = pn;
    end
    r = pn;
end
