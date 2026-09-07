% Q19: Compare Newton, Secant and False Position on two equations
clc; clear;
tol = 1e-6; maxit = 200;
eqs = {
    @(x) 3*x - exp(x),            @(x) 3 - exp(x),            1, 2, '19a';
    @(x) 2*x + 3*cos(x) - exp(x), @(x) 2 - 3*sin(x) - exp(x), 1, 2, '19b'};
for j = 1:size(eqs,1)
    f = eqs{j,1}; df = eqs{j,2}; a = eqs{j,3}; b = eqs{j,4}; lbl = eqs{j,5};

    p = (a+b)/2;                                    % Newton (midpoint start)
    for k = 1:maxit, pn = p - f(p)/df(p); if abs(pn-p) < tol, break; end, p = pn; end
    rN = pn; iN = k;

    p0 = a; p1 = b; f0 = f(p0); f1 = f(p1);         % Secant (endpoints)
    for k = 1:maxit
        ps = p1 - f1*(p1-p0)/(f1-f0); if abs(ps-p1) < tol, break; end
        p0 = p1; f0 = f1; p1 = ps; f1 = f(ps);
    end
    rS = ps; iS = k;

    aa = a; bb = b; fa = f(aa); fb = f(bb); pold = NaN; pf = aa;   % False position
    for k = 1:maxit
        pf = bb - fb*(bb-aa)/(fb-fa); fp = f(pf);
        if fp == 0 || (~isnan(pold) && abs(pf-pold) < tol), break; end
        if fa*fp < 0, bb = pf; fb = fp; else, aa = pf; fa = fp; end
        pold = pf;
    end
    rF = pf; iF = k;

    fprintf('%s Newton   : %.6f (%d its, res %.2e)\n', lbl, rN, iN, abs(f(rN)));
    fprintf('%s Secant   : %.6f (%d its, res %.2e)\n', lbl, rS, iS, abs(f(rS)));
    fprintf('%s FalsePos : %.6f (%d its, res %.2e)\n', lbl, rF, iF, abs(f(rF)));
end
