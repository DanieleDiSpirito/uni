clear; clc;
syms t n x(t)

% --- 1. Definizione automatica del segnale (Onda Quadra) ---
T = 2;              % Periodo
tau = 1;
A = 1;              % Ampiezza
f0 = 1/T;
w0 = 2*pi/T;

% Definiamo l'onda quadra su un periodo usando la funzione 'piecewise'
% (Da -T/2 a 0 vale 0, da 0 a T/2 vale A)
x(t) = piecewise(abs(t) < tau/2, A, abs(t) >= tau/2, 0);

t_ = linspace(-T, T, 1000);
x_ = subs(x(t), t, t_);
% plot(t_, x_);

% --- 2. Calcolo AUTOMATICO dei Coefficienti ---
% Coefficiente b0 (valore medio)
b0 = (1/T) * int(x, t, -T/2, T/2);

% Coefficienti an (termini in seno)
an = (2/T) * int(x * sin(n * w0 * t), t, -T/2, T/2);

% Coefficienti bn (termini in coseno)
bn = (2/T) * int(x * cos(n * w0 * t), t, -T/2, T/2);

fprintf('Coefficiente b0: %s\n', char(b0));
fprintf('Coefficiente an: %s\n', an);
fprintf('Coefficiente bn: %s\n', char(bn));

% --- 3. Ricostruzione del segnale ---
N_armonics = 30; % Numero di armoniche da calcolare
t_val = linspace(-T, T, 500);
y_approx = double(b0); % Inizia dal valore medio

for i = 1:N_armonics
    % Sostituisce 'n' con il valore dell'armonica corrente e somma
    term_a = subs(an, n, i) * sin(i * w0 * t_val);
    term_b = subs(bn, n, i) * cos(i * w0 * t_val);
    y_approx = y_approx + double(term_a + term_b);
end

% --- 4. Plot ---
subplot(2, 1, 1);
plot(t_val, y_approx, 'LineWidth', 2);
grid on;
title(['Ricostruzione Automatica con ', num2str(N_armonics), ' armoniche']);
xlabel('Tempo [s]'); ylabel('Ampiezza');

subplot(2, 1, 2);
i = [-N_armonics/2:-1, eps, 1:N_armonics/2];
bn_val = subs(bn, n, i);
stem(i, bn_val);
