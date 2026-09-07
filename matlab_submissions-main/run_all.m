function run_all()
files = {
    'q01_bisection.m'
    'q02_bisection.m'
    'q03_bisection.m'
    'q04_intersection.m'
    'q05_intersection.m'
    'q06_bisection.m'
    'q07_cuberoot.m'
    'q08_bisection_bound.m'
    'q09_fixedpoint.m'
    'q10_fixedpoint.m'
    'q11_fixedpoint.m'
    'q12_fixedpoint.m'
    'q13_fixedpoint.m'
    'q14_fixedpoint.m'
    'q15_fallingbody.m'
    'q16_newton.m'
    'q17_secant.m'
    'q18_falseposition.m'
    'q19_compare.m'
    'q20_compare.m'
    'q21_newton.m'
    'q22_newton.m'};

outfile = 'results.txt';
if exist(outfile, 'file'), delete(outfile); end
diary(outfile); diary on;
fprintf('Numerical Methods Practice Sheet 1 - computed results\n');
fprintf('Generated: %s\n', datestr(now));

for i = 1:numel(files)
    fprintf('\n===== %s =====\n', files{i});
    try
        run_one(files{i});
    catch err
        fprintf('ERROR in %s: %s\n', files{i}, err.message);
    end
    close all;  
end

diary off;
fprintf('\nDone. All results written to %s\n', outfile);
end

function run_one(name)
run(name);
end
