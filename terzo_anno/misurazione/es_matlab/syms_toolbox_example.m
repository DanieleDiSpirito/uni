syms x lambda real positive

f0 = exp(-lambda*x);

int_f0 = int(f0, x, 0, inf);
k = 1/int_f0; % normalization coeff
f = k*f0; % normalized function

mu = int(x*f, x, 0, inf); % medium value
P = int(x^2 * f, x, 0, inf); % power
sigma2 = P - mu^2; % st dev ^ 2

f1 = subs(f, lambda, 2); % [lambda <- 2] in f
fplot(f1); % cannot plot f (with 2 variables)