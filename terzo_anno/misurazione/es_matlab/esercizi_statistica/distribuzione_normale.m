clear; clc; rng shuffle; clf;

mu = 12;
sigma = 2;

z = linspace(-5, 5, 1e5 + 1);
alpha = linspace(0, 1, 1e5 + 1);

x = mu + sigma*z;

a = 13;
b = 14;

hold on;
plot(z, normpdf(z));
plot(z, normcdf(z));
plot(z, norminv(z));
pause;
hold off;

f = normpdf((x - mu) / sigma) / sigma;

subplot(2, 1, 1);
plot(z, normpdf(z));
xline((a-mu)/sigma, 'b', 'a_Z');
xline((b-mu)/sigma, 'g', 'b_Z');
subplot(2, 1, 2);
plot(x, f);
xline(a, 'b', 'a');
xline(b, 'g', 'b');

dx = x(2) - x(1);
m0 = sum(f * dx);

intervalloX = (x <= b & x > a);
P_ab_pdf_X = sum(f(intervalloX)*dx);

intervalloZ = (z <= (b-mu)/sigma & z > (a-mu)/sigma);
dz = z(2) - z(1);
P_ab_pdf_Z = sum(normpdf(z(intervalloZ))*dz);

P_ab_cdf_Z = normcdf((b-mu)/sigma) - normcdf((a-mu)/sigma);

pause;
hold off;

sigmaZ = 1;
muZ = 0;

subplot(2, 1, 1);
plot(z, normpdf(z));
xline(muZ, '-', '\mu');
xline(muZ + sigmaZ, '-', '\mu + \sigma');
xline(muZ - sigmaZ, '-', '\mu - \sigma');
xline(muZ + 2*sigmaZ, '-', '\mu + 2\sigma');
xline(muZ - 2*sigmaZ, '-', '\mu - 2\sigma');
subplot(2, 1, 2);
plot(x, f);
xline(mu, '-', '\mu');
xline(mu + sigma, '-', '\mu + \sigma');
xline(mu - sigma, '-', '\mu - \sigma');
xline(mu + 2*sigma, '-', '\mu + 2\sigma');
xline(mu - 2*sigma, '-', '\mu - 2\sigma');

P_1sigma = sum(normpdf(z(z >= -sigmaZ & z < sigmaZ)) * dz);
P_2sigma = sum(normpdf(z(z >= -2*sigmaZ & z < 2*sigmaZ)) * dz);
P_1sigma_X = sum(f(x >= mu - sigma & x < mu + sigma) * dx);
P_2sigma_X = sum(f(x >= mu - 2*sigma & x < mu + 2*sigma) * dx);
