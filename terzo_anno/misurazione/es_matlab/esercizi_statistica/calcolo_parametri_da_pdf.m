clc;

START = -10;
END = 50;
N_intervals = 1e3 + 1;
x = linspace(START, END, N_intervals);
n = 3; mu = 3;

f = gampdf(x, n, mu);
dx = x(2) - x(1);

% momento
m0 = sum(f*dx); % should be 1
m1 = sum(x.*f*dx);
m2 = sum(x.^2.*f*dx);

mu = m1;
P = m2;

% momento centrale
mc1 = sum((x - mu).*f*dx); % should be 0
mc2 = sum((x - mu).^2.*f*dx);

sigma2 = mc2;
sigma = sqrt(sigma2);

MAV = sum(abs(x).*f*dx); % mean absolute value = E[abs(x)]
MAD = sum(abs(x-mu).*f*dx); % mean absolute deviation = E[abs(x - mu)]

moda = x(f == max(f));
[M, moda1] = max(f); % [max_value, idx_max_value] = max(array)
moda1 = (moda1-1) * dx + START; % alternative way
plot(x,f), xline(moda);

hold on;

F_start = 0;
F_end = 1;

F = cumsum(f * dx);
plot(x, F);