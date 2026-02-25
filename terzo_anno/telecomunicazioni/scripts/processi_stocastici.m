%% Analisi Statistica Comparativa: Processi X1 e X2
clear; clc; close all;

% --- 1. Parametri dei Segnali ---
fs = 1000;              
t = 0:1/fs:1-1/fs;      
f1 = 3;                 % Frequenza X1
f2 = 8;                % Frequenza X2 (cambiata per contrasto visivo)
A = 2;                  % Ampiezza comune

N = 5000; % Numero di realizzazioni per la statistica di insieme
theta1 = 2*pi*rand(N, 1); 
theta2 = 2*pi*rand(N, 1);

% Generazione Processi (Matrici: Realizzazioni x Tempo)
X1 = A * cos(2*pi*f1*t + theta1) + 2;
X2 = A * cos(2*pi*f2*t + theta2) + 2;

% --- 2. Calcolo Funzioni di Secondo Ordine (su singola realizzazione) ---
% Prendiamo la prima riga di ogni matrice (ipotesi di ergodicità per WSS)
[R1, lags] = xcorr(X1(1,:), 'biased'); % <- il decadimento ai lati è dovuto a 'biased', 'unbiased' dà il valore teorico (coseno)
[R2, ~]    = xcorr(X2(1,:), 'biased');
tau = lags/fs;

% Autocovarianza C(tau) = R(tau) - mu^2
C1 = R1 - (mean(X1(1,:)))^2;
C2 = R2 - (mean(X2(1,:)))^2;

% --- 3. Visualizzazione Grafica (4 Plot) ---
figure('Color', 'w', 'Position', [100 100 1000 700]);

% TOP LEFT: Segnale 1 nel tempo
subplot(2,2,1);
plot(t, X1(1:3,:));
title(['X1: 3 realizzazioni (f=', num2str(f1), 'Hz)']); 
xlabel('Tempo [s]'); grid on;

% TOP RIGHT: Segnale 2 nel tempo
subplot(2,2,2);
plot(t, X2(1:3,:));
title(['X2: 3 realizzazioni (f=', num2str(f2), 'Hz)']); 
xlabel('Tempo [s]'); grid on;

% BOTTOM RIGHT: Autocorr e Autocov per X1
subplot(2,2,3);
hold on;
plot(tau, R1, 'b', 'LineWidth', 1.2, 'DisplayName', 'R_{X1}(\tau)');
plot(tau, C1, 'r--', 'LineWidth', 1, 'DisplayName', 'C_{X1}(\tau)');
xlim([-0.8 0.8]); title('X1: Secondo Ordine');
xlabel('\tau [s]'); legend; grid on;

% BOTTOM LEFT: Autocorr e Autocov per X2
subplot(2,2,4);
hold on;
plot(tau, R2, 'b', 'LineWidth', 1.2, 'DisplayName', 'R_{X2}(\tau)');
plot(tau, C2, 'r--', 'LineWidth', 1, 'DisplayName', 'C_{X2}(\tau)');
xlim([-0.8 0.8]); title('X2: Secondo Ordine');
xlabel('\tau [s]'); legend; grid on;

% --- 4. Stampa Parametri Statistici ---
fprintf('--- PARAMETRI STATISTICI ORDINE 1 ---\n');
fprintf('SEGNALE 1 (f=%d Hz):\n', f1);
fprintf('  Media stimata:    %.4f (Teorica: 0)\n', mean(X1(:)));
fprintf('  Potenza stimata:  %.4f (Teorica: %.2f)\n', mean(X1(:).^2), A^2/2);
fprintf('  Varianza stimata: %.4f (Teorica: %.2f)\n\n', var(X1(:)), A^2/2);

fprintf('SEGNALE 2 (f=%d Hz):\n', f2);
fprintf('  Media stimata:    %.4f (Teorica: 0)\n', mean(X2(:)));
fprintf('  Potenza stimata:  %.4f (Teorica: %.2f)\n', mean(X2(:).^2), A^2/2);
fprintf('  Varianza stimata: %.4f (Teorica: %.2f)\n', var(X2(:)), A^2/2);