% Q4: First positive solution of x = 2 sin x (plot y=x and y=2 sin x)
clc; clear;
f = @(x) x - 2*sin(x);
x = linspace(0, pi, 400);
plot(x, x, 'b', x, 2*sin(x), 'r'); grid on;
legend('y = x', 'y = 2 sin x'); xlabel('x'); ylabel('y'); title('x = 2 sin x');
a = 1.5; b = 2.5; tol = 1e-6;
while (b-a)/2 > tol
    p = (a+b)/2;
    if f(a)*f(p) < 0, b = p; else, a = p; end
end
p = (a+b)/2;
fprintf('First positive solution x = %.6f, residual = %.2e\n', p, abs(f(p)));
