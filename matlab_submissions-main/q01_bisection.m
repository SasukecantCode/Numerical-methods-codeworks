% Q1: Three bisection steps for sqrt(x) - cos(x) = 0 on [0,1]
clc; clear;
f = @(x) sqrt(x) - cos(x);
a = 0; b = 1;
for k = 1:3
    p = (a+b)/2;
    if f(a)*f(p) < 0
        b = p;
    else
        a = p;
    end
end
fprintf('Third midpoint p3 = %.6f\n', p);
