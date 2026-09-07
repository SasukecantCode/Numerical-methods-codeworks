function make_pdf()
items = {
    'q01_bisection.m'       'Q1  - Three bisection steps for sqrt(x)-cos(x)=0 on [0,1]'
    'q02_bisection.m'       'Q2  - Bisection for x^3-7x^2+14x-6=0 on three intervals'
    'q03_bisection.m'       'Q3  - Bisection to 1e-5 for several equations'
    'q04_intersection.m'    'Q4  - First positive solution of x = 2 sin x (plot)'
    'q05_intersection.m'    'Q5  - Intersection of e^x-2 and cos(e^x-2) (plot)'
    'q06_bisection.m'       'Q6  - Bisection behaviour with multiple/even-multiplicity roots'
    'q07_cuberoot.m'        'Q7  - Cube root of 25 via x^3-25=0'
    'q08_bisection_bound.m' 'Q8  - Iteration bound and root of x^3-x-1=0'
    'q09_fixedpoint.m'      'Q9  - Fixed point for x^4-3x^2-3=0'
    'q10_fixedpoint.m'      'Q10 - Fixed point g(x)=pi+0.5 sin(x/2), contraction bound'
    'q11_fixedpoint.m'      'Q11 - sqrt(3) via g(x)=0.5(x+3/x)'
    'q12_fixedpoint.m'      'Q12 - Six fixed-point rearrangements'
    'q13_fixedpoint.m'      'Q13 - All real zeros of x^2+10 cos x=0'
    'q14_fixedpoint.m'      'Q14 - Fixed point for 2 sin(pi x)+x=0'
    'q15_fallingbody.m'     'Q15 - Falling-body model, impact time'
    'q16_newton.m'          'Q16 - Newton''s method, four equations'
    'q17_secant.m'          'Q17 - Secant method, same four equations'
    'q18_falseposition.m'   'Q18 - False position, same four equations'
    'q19_compare.m'         'Q19 - Newton vs Secant vs False Position (two equations)'
    'q20_compare.m'         'Q20 - Three methods for both zeros of a quartic'
    'q21_newton.m'          'Q21 - Zeros of ln(x^2+1)-e^(0.4x) cos(pi x), 25th zero'
    'q22_newton.m'          'Q22 - Solve 3^(3x+1)-7*5^(2x)=0 to high precision (plot)'};

reportFile = 'report.m';
fid = fopen(reportFile, 'w');
fprintf(fid, '%%%% Practice Sheet 1 - Root-Finding Methods\n');
fprintf(fid, '%% Worked solutions covering Problems 1 through 22.\n');
fprintf(fid, '%% Compiled on %s.\n\n', datestr(now, 'dd mmm yyyy, HH:MM'));
for i = 1:size(items,1)
    label = strrep(items{i,2}, 'Q', 'Problem ');
    fprintf(fid, '%%%% %s\n', label);
    fprintf(fid, '%%%%\n');
    fprintf(fid, '%% ---------------------------------------------\n');
    code = fileread(items{i,1});
    fprintf(fid, '%s\n\n', code);
end
fprintf(fid, '%%%% End of Report\n');
fclose(fid);

opts = struct('format','pdf','showCode',true,'maxOutputLines',80, ...
              'catchError',true,'figureSnapMethod','print','outputDir',pwd, ...
              'imageFormat','png');
outPath = publish(reportFile, opts);
close all;
fprintf('PDF written to: %s\n', outPath);
end
