% Q12: Fixed-point iteration for six rearrangements (tol 1e-5)
clc; clear;
tol = 1e-5; maxit = 200;
maps = {
    @(x) (2 - exp(x) + x.^2)/3, 0.5, '12a';
    @(x) 5./x.^2 + 2,           3.0, '12b';
    @(x) sqrt(exp(x)/3),        1.0, '12c';
    @(x) 5.^(-x),               0.5, '12d';
    @(x) 6.^(-x),               0.5, '12e';
    @(x) 0.5*(sin(x)+cos(x)),   0.5, '12f'};
for j = 1:size(maps,1)
    g = maps{j,1}; p = maps{j,2};
    for k = 1:maxit
        pnew = g(p);
        if abs(pnew - p) < tol, break; end
        p = pnew;
    end
    fprintf('%-5s fixed point = %.6f in %d iters\n', maps{j,3}, pnew, k);
end
