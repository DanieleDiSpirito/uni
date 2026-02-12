%% Risposta di G(s) a diversi tipi di ricostruzione del segnale
clear; clc; close all;

% --- 1. Definizione del Sistema e del Tempo ---
% G(s) = 1 / (s + 1)
num = 1;
den = [1 1];
sys = tf(num, den);

% Parametri temporali
T = 1;              % Periodo di campionamento
T_sim = 6;          % Durata simulazione
dt = 0.01;          % Risoluzione fine per la simulazione continua
t = 0:dt:T_sim;     % Vettore tempo continuo

% Istanti di campionamento discreti
k_idx = 0:T:T_sim;  

% --- 2. Generazione degli Ingressi (Input) ---

% A. Segnale Continuo x(t) = e^-t
x_cont = exp(-t);

% Campioni discreti x*(k)
x_samples = exp(-k_idx);

% B. Treno di Impulsi (Approssimazione per simulazione)
% Un impulso di Dirac è approssimato come un rettangolo di base dt e altezza x/dt
x_impulse = zeros(size(t));
for i = 1:length(k_idx)
    % Trova l'indice nel vettore t più vicino all'istante di campionamento
    [~, idx] = min(abs(t - k_idx(i))); 
    % Area dell'impulso deve essere pari al campione
    x_impulse(idx) = x_samples(i) / dt; 
end

% C. Ricostruzione ZOH (Zero Order Hold)
x_zoh = zeros(size(t));
for i = 1:length(t)
    % Trova l'ultimo campione valido (k)
    k_current = floor(t(i)/T);
    idx_sample = k_current + 1; % Indice MATLAB (1-based)
    if idx_sample <= length(x_samples)
        x_zoh(i) = x_samples(idx_sample);
    end
end

% D. Ricostruzione FOH (First Order Hold - Causale)
% Formula: x(t) = x[k] + (x[k] - x[k-1])/T * (t - kT)
x_foh = zeros(size(t));
for i = 1:length(t)
    k = floor(t(i)/T);
    idx_k = k + 1;
    
    if idx_k == 1
        % Al primo passo (t < T) assumiamo x[-1] = 0 per la pendenza
        xk = x_samples(1);
        slope = (xk - 0) / T; % Pendenza tra 0 e x(0)
        x_foh(i) = xk + slope * (t(i) - 0); % O semplicemente xk se non predittivo puro
    elseif idx_k <= length(x_samples)
        xk = x_samples(idx_k);
        xk_prev = x_samples(idx_k-1);
        slope = (xk - xk_prev) / T;
        dt_loc = t(i) - k_idx(idx_k);
        x_foh(i) = xk + slope * dt_loc;
    end
end

% --- 3. Calcolo delle Risposte del Sistema (Output) ---
% Usiamo lsim per simulare la risposta di G(s) ai vari ingressi
y_cont = lsim(sys, x_cont, t);      % Risposta ideale
y_imp  = lsim(sys, x_impulse, t);   % Risposta al treno di impulsi
y_zoh  = lsim(sys, x_zoh, t);       % Risposta all'ingresso a gradini
y_foh  = lsim(sys, x_foh, t);       % Risposta all'ingresso FOH

% Soluzione Analitica Esatta per il caso continuo (per verifica)
% Y(s) = 1/(s+1)^2 -> y(t) = t*e^-t
y_exact = t .* exp(-t); 

% --- 4. Plot dei Risultati ---

figure('Name', 'Analisi Risposte', 'Position', [100, 100, 1200, 800]);

% --- SUBPLOT 1: Gli Ingressi ---
subplot(2,1,1);
hold on; grid on;
plot(t, x_cont, 'k', 'LineWidth', 2, 'DisplayName', 'x(t) Continuo');
stairs(t, x_zoh, 'b', 'LineWidth', 1.5, 'DisplayName', 'x_{ZOH}(t)');
plot(t, x_foh, 'm', 'LineWidth', 1.2, 'DisplayName', 'x_{FOH}(t)');
stem(k_idx, x_samples, 'r', 'filled', 'DisplayName', 'Campioni x*');
title('1. Segnali di Ingresso applicati a G(s)');
legend('Location', 'northeast');
xlabel('Tempo [s]'); ylabel('Ampiezza');

% --- SUBPLOT 2: Le Risposte (Uscite) ---
subplot(2,1,2);
hold on; grid on;

% Risposta Ideale
plot(t, y_cont, 'k', 'LineWidth', 2, 'DisplayName', 'y(t) Ideale (te^-^t)');

% Risposta al campionamento impulsivo
plot(t, y_imp, 'r--', 'LineWidth', 1, 'DisplayName', 'Risposta a Impulsi (x*)');

% Risposta allo ZOH
plot(t, y_zoh, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Risposta a ZOH');

% Risposta al FOH
plot(t, y_foh, 'm-', 'LineWidth', 1.5, 'DisplayName', 'Risposta a FOH');

title('2. Risposta del sistema G(s) = 1/(s+1)');
xlabel('Tempo [s]'); ylabel('Uscita y(t)');
legend('Location', 'northeast');