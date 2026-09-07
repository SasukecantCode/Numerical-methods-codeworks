% Q20: Newton, Secant and False Position for both real zeros of
clc; clear;
f  = @(x) 230*x.^4 + 18*x.^3 + 9*x.^2 - 221*x - 9;
df = @(x) 920*x.^3 + 54*x.^2 + 18*x - 221;
tol = 1e-8; maxit = 200;
targets = {
    -0.5, -1.0,  0.0, -1.0, 0.0, 'root in [-1,0]';
     1.0,  0.9,  1.0,  0.0, 1.0, 'root in [ 0,1]'};
for j = 1:size(targets,1)
    pN0 = targets{j,1}; sP0 = targets{j,2}; sP1 = targets{j,3};
    fpA = targets{j,4}; fpB = targets{j,5}; lbl = targets{j,6};

    p = pN0;                                        % Newton
    for k = 1:maxit, pn = p - f(p)/df(p); if abs(pn-p) < tol, break; end, p = pn; end
    rN = pn; iN = k;

    p0 = sP0; p1 = sP1; f0 = f(p0); f1 = f(p1);     % Secant
    for k = 1:maxit
        ps = p1 - f1*(p1-p0)/(f1-f0); if abs(ps-p1) < tol, break; end
        p0 = p1; f0 = f1; p1 = ps; f1 = f(ps);
    end
    rS = ps; iS = k;

    a = fpA; b = fpB; fa = f(a); fb = f(b); pold = NaN; pf = a;   
    for k = 1:maxit
        pf = b - fb*(b-a)/(fb-fa); fp = f(pf);
        if fp == 0 || (~isnan(pold) && abs(pf-pold) < tol), break; end
        if fa*fp < 0, b = pf; fb = fp; else, a = pf; fa = fp; end
        pold = pf;
    end
    rF = pf; iF = k;

    fprintf('%s: Newton %.8f (%d) | Secant %.8f (%d) | FalsePos %.8f (%d)\n', ...
        lbl, rN, iN, rS, iS, rF, iF);
end
