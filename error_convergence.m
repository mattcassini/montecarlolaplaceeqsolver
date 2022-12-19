%Error Between Monte Carlo Solution and Analytical Solution

for i = 6:25:350
    if i==j
        continue
    end
    u_exact = equipotential_lines(i);
    for j = [10 100 350]
        u_approx = tour_du_wino(i,j);
    end
    err = abs(u_exact - u_approx);
    maxerr(i,j) = max(err(:));
    L1err(i,j) = mean(err(:));
end

load gong
sound(y,Fs)