%Error Between Monte Carlo Solution and Analytical Solution
clear;close all;
n = [175 200];
m = [100 1000];
for i = 1:length(n)
    u_exact = equipotential_lines(n(i))';
    for j = 1:length(m)
        u_approx = tour_du_wino(n(i),m(j));
        err = abs(u_exact - u_approx);
        maxerr(i,j) = max(err(:));
        L1err(i,j) = mean(err(:),'omitnan');
    end
end

load gong
sound(y,Fs)