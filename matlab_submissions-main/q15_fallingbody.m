% Q15: Falling-body model, solve s(t) = 0 to 0.01 s
clc; clear;
s0 = 300; m = 0.25; k = 0.1; g = 32.17;
s = @(t) s0 - (m*g/k)*t + (m^2*g/k^2)*(1 - exp(-k*t/m));
a = 0; b = 10; tol = 1e-4;
while (b-a)/2 > tol
    p = (a+b)/2;
    if s(a)*s(p) < 0, b = p; else, a = p; end
end
p = (a+b)/2;
fprintf('Impact time t = %.4f s, residual = %.2e\n', p, abs(s(p)));
