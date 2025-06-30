f = @(x) 3 * log(x) - x;
a = 1;
b = exp(1);
dom = linspace(a, b, 100);
fx = f(dom);
plot(dom, fx, "blue");
% bisezione
[zeroBisezione, nIter] = bisezione(f, a, b, 1e-12);
xline(zeroBisezione);
yline(0);
axis([a, b, f(a), f(b)]);
hold on;
plot(zeroBisezione, f(zeroBisezione), "blacko");
fprintf("Metodo di bisezione\nLo zero vale (%d, %d)\nN° iterazioni: %i\n", zeroBisezione, f(zeroBisezione), nIter);
% newton
x0 = 1;
df = @(x) 3 ./ x - 1;
[zeroNewton, nIter] = newton(x0, f, df, 1e-12);
fprintf("Metodo di Newton\nLo zero vale (%d, %d)\nN° iterazioni: %i\n", zeroNewton, f(zeroNewton), nIter);
% secante
[zeroSecante, nIter] = secante(f, 1, exp(1), 1e-12);
fprintf("Metodo delle secanti\nLo zero vale (%d, %d)\nN° iterazioni: %i\n", zeroSecante, f(zeroSecante), nIter);

zeroMatlab = fsolve(f, 1);
fprintf("Metodo Matlab\nLo zero vale (%d, %d)\nN° iterazioni: %i\n", zeroMatlab, f(zeroMatlab));

format long;
zeroBisezione
zeroNewton
zeroSecante
zeroMatlab