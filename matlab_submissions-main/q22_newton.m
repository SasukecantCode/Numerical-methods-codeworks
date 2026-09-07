% Q22: Solve 3^(3x+1) - 7*5^(2x) = 0 to high precision
clc; clear; format long g;
f = @(x) 3.^(3*x+1) - 7*5.^(2*x);
h  = @(x) (3*x+1)*log(3) - log(7) - 2*x*log(5);
dh = @(x) 3*log(3) - 2*log(5);

x = linspace(9, 13, 400);
plot(x, arrayfun(h, x), 'b'); grid on; yline(0,'r');
xlabel('x'); ylabel('log 3^{3x+1} - log(7 \cdot 5^{2x})'); title('Q22');

p = 10; tol = 1e-14; maxit = 100;
for k = 1:maxit
    pnew = p - h(p)/dh(p);
    if abs(pnew - p) < tol, break; end
    p = pnew;
end
fprintf('Root x = %.17g in %d iters\n', pnew, k);
fprintf('log-residual |h(x)| = %.2e\n', abs(h(pnew)));
