clear, clc, rng(0), clf;

N = 1e5;
X = gamrnd(5,2,[1,N]);

mu = sum(X) / N;
P = mean(X.^2); % potenza

ms_teo = 0 % valore teorico della media degli scarti
ms = mean(X - mu) % media degli scarti calcolata dalla popolazione

sigma2 = sum((X-mu).^2) / N;% varianza (media degli scarti quadratici)
sigma = sqrt(sigma2) % deviazione standard (scarto quadratico medio)

MAD = mean(abs(X - mu)); % mean absolute deviation della v.a.
mcosx = mean(cos(X)); % media del coseno dei valori della popolazione

histogram(X, 'Normalization', 'pdf');
xline(mu, 'k', '\mu');

cp = 0.8;
p_left = 0.05;

a1 = quantile(X, p_left);
b1 = quantile(X, cp + p_left);

xline(a1, 'k', 'a_1');
xline(b1, 'k', 'b_1');

a2 = quantile(X, (1-cp)/2);
b2 = quantile(X, (1+cp)/2);

xline(a2, 'k', 'a_2');
xline(b2, 'k', 'b_2');

q1 = quantile(X, 0.25);
q2 = quantile(X, 0.50);
q3 = quantile(X, 0.75);
iqr = q3 - q1;