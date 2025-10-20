clear, clc, rng(0), clf;

U = 10; % copertura massima
N = 20;

u1 = U/sqrt(3); % std errore per fdt1 (incertezza standard)
u2 = U/sqrt(6); % std errore per fdt2
u3 = U/sqrt(2); % std errore per fdt3
u4 = U/sqrt(9); % std errore per fdt4
u5 = U/sqrt(3*N); % std errore per fdt5

x = linspace(-1.5*U, 1.5*U, 1001);
f1 = unifpdf(x, -U, U);
f2 = tripuls(x / (2*U)) / U;
f3 = 1/pi ./ sqrt(1 - (x/U).^2) / U;
f3(not(imag(f3) == 0)) = 0;
f4 = normpdf(x/u4) / u4;
f5 = normpdf(x/u5) / u5;
plot(x, f1, 'r', x, f2, 'g', x, f3, 'b', x, f4, 'w', x, f5, 'y');
ylim([0,2/U])

xline(u1, '--r', 'u_1')
xline(u2, '--g', 'u_2')
xline(u3, '--b', 'u_3')
xline(u4, '--w', 'u_4')
xline(u5, '--y', 'u_5')
xline(-u1, '--r', '-u_1')
xline(-u2, '--g', '-u_2')
xline(-u3, '--b', '-u_3')
xline(-u4, '--w', '-u_4')
xline(-u5, '--y', '-u_5')

kmax1 = U / u1;
kmax2 = U / u2;
kmax3 = U / u3;

cp = 0.95;
k = norminv((1+cp) / 2);

cp1 = cp; cp2 = cp; cp3 = cp; cp4 = cp; cp5 = cp;

[Ucp1, i1] = min([U, k*u1]);
if i1 == 1
    cp1 = 1;
end
[Ucp2, i2] = min([U, k*u2]);
if i2 == 1
    cp2 = 1;
end
[Ucp3, i3] = min([U, k*u3]);
if i3 == 1
    cp3 = 1;
end
[Ucp4, i4] = min([U, k*u4]);
if i4 == 1
    cp4 = 1;
end
[Ucp5, i5] = min([U, k*u5]);
if i5 == 1
    cp5 = 1;
end

Ucp_5 = 5.0;
k5 = Ucp_5 / u5;
cp_5 = 2 * normcdf(k5) - 1;

% ===================================== %
pause;

mu = 0;
u = 3;

f = normpdf(x, mu, u);

plot(x, f);

U = +inf;
kmax = U / u;

cp_0 = 0.97;
k0 = norminv((1+cp_0)/2);
Ucp_0 = k0 * u;
xline(Ucp_0, '--g', 'U_{0.97}');
xline(-Ucp_0, '--g', '-U_{0.97}');

k1 = 2.5;
cp_1 = 2*normcdf(k1) - 1;
Ucp_1 = k1 * u;
xline(Ucp_1, '--y', '2.5\sigma');
xline(-Ucp_1, '--y', '-2.5\sigma');

k90 = floor(norminv((1+0.9)/2) * 100) / 100;
Ucp_90 = k90 * u;
xline(Ucp_90, '--r', 'U_{0.90}');
xline(-Ucp_90, '--r', '-U_{0.90}');

