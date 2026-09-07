% Q5: Intersection of y = e^x - 2 and y = cos(e^x - 2) on [0.5,1.5]
clc; clear;
f = @(x) (exp(x) - 2) - cos(exp(x) - 2);
x = linspace(0.5, 1.5, 400);
plot(x, exp(x)-2, 'b', x, cos(exp(x)-2), 'r'); grid on;
legend('y = e^x - 2', 'y = cos(e^x - 2)'); xlabel('x'); ylabel('y');
a = 0.5; b = 1.5; tol = 1e-6;
while (b-a)/2 > tol
    p = (a+b)/2;
    if f(a)*f(p) < 0, b = p; else, a = p; end
end
p = (a+b)/2;
fprintf('Intersection x = %.6f, residual = %.2e\n', p, abs(f(p)));
