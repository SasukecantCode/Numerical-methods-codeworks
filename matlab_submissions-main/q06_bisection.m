% Q6: Bisection behaviour for a function with even- and odd-multiplicity roots
clc; clear;
f = @(x) (x+2).*(x+1).^2.*x.*(x-1).^3.*(x-2);
brackets = [-2.5 -1.5; -1.5 0.5; -0.5 0.5; 0.5 1.5; 0.5 2.5; -2.5 2.5];
tol = 1e-6;
for j = 1:size(brackets,1)
    a = brackets(j,1); b = brackets(j,2);
    if f(a)*f(b) > 0
        fprintf('[%+.1f,%+.1f]: no sign change (even-multiplicity root not detected)\n', a, b);
        continue;
    end
    while (b-a)/2 > tol
        p = (a+b)/2;
        if f(a)*f(p) < 0, b = p; else, a = p; end
    end
    p = (a+b)/2;
    fprintf('[%+.1f,%+.1f]: root = %+.6f, residual = %.2e\n', ...
        brackets(j,1), brackets(j,2), p, abs(f(p)));
end
