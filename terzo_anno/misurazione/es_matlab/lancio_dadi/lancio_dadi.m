rng(0);

Ndadi = 50;
Nsim = 1e6;

% Monte Carlo Simulation (only if Ndadi <= 10)
if Ndadi <= 10
    X = randi(6, [Ndadi, Nsim]);
    S = sum(X);
    histogram(S, 'Normalization', 'pdf');
end

hold on;

mu = 3.5 * Ndadi;

var_dado = 0;
for i = 1:6
    var_dado = var_dado + (i - 3.5)^2;
end
var_dado = var_dado / 6;
var = Ndadi * var_dado;
dev_st_1 = sqrt(var);
dev_st_2 = sqrt(var * 6 / 5); % 1/(n-1) dev. st. campionaria
b = 6; a = 0;
dev_st_3 = sqrt((b-a)^2 / 12 * Ndadi);% approx to uniform distribution

xmin = Ndadi;
xmax = Ndadi * 6;
x = linspace(xmin, xmax, Nsim);
fX_1 = normpdf(x, mu, dev_st_1);
% fX_2 = normpdf(x, mu, dev_st_2);
fX_3 = normpdf(x, mu, dev_st_3);

fX_dado = ones(1, 6) / 6;
fX = fX_dado;

for i = 1:Ndadi-1
    fX = conv(fX, fX_dado);
end
real_curve = fX;

LINE_WIDTH = 1.5;
p1 = plot(x, fX_1, 'r');
p1(1).LineWidth = LINE_WIDTH;
% p2 = plot(x, fX_2, 'y');
% p2(1).LineWidth = LINE_WIDTH;
p3 = plot(x, fX_3, 'g');
p3(1).LineWidth = LINE_WIDTH;
p4 = plot(Ndadi:Ndadi*6, real_curve, 'b');
p4(1).LineWidth = LINE_WIDTH;

if Ndadi <= 10
    % legend('Monte Carlo sim', '1/n', '1/(n-1)', 'uniform', 'Real');
    legend('Monte Carlo sim', '1/n', 'uniform', 'conv');
else
    % legend'1/n', '1/(n-1)', 'uniform', 'Real');
    legend('1/n', 'uniform', 'conv');
end

title("Lancio di " + num2str(Ndadi) + " dadi");
hold off;