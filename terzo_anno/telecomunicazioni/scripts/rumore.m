%% Autocorrelazione con decadimento (Processo con Rumore)
clear; clc; close all;

fs = 1000;              
t = 0:1/fs:2;           % Aumentiamo la durata a 2 secondi per vedere meglio i lati
f1 = 1; f2 = 3;
A = 2;

% Generazione realizzazioni con aggiunta di rumore bianco (AWGN)
% Il rumore "rompe" la memoria infinita della sinusoide
N = 1000;
theta1 = 2*pi*rand(N, 1); 
theta2 = 2*pi*rand(N, 1);

% Segnale = Sinusoide + Rumore
X1 = A * cos(2*pi*f1*t + theta1) + 0.5*randn(N, length(t));
X2 = A * cos(2*pi*f2*t + theta2) + 0.5*randn(N, length(t));

% Calcolo Funzioni (su singola realizzazione)
[R1, lags] = xcorr(X1(1,:), 'biased'); 
[R2, ~]    = xcorr(X2(1,:), 'biased');
tau = lags/fs;

% Autocovarianza
C1 = R1 - (mean(X1(1,:)))^2;
C2 = R2 - (mean(X2(1,:)))^2;

% --- Plotting ---
figure('Color', 'w', 'Position', [100 100 1000 700]);

subplot(2,2,1); plot(t, X1(1,:)); title('X1(t) con Rumore'); grid on;
subplot(2,2,2); plot(t, X2(1,:)); title('X2(t) con Rumore'); grid on;

% Noterai che ai lati (tau grandi) l'ampiezza diminuisce
subplot(2,2,3); hold on;
plot(tau, R1, 'b', 'DisplayName', 'R_{X1}');
plot(tau, C1, 'r--', 'DisplayName', 'C_{X1}');
title('X1: Decadimento ai lati'); xlabel('\tau [s]'); legend; grid on;

subplot(2,2,4); hold on;
plot(tau, R2, 'b', 'DisplayName', 'R_{X2}');
plot(tau, C2, 'r--', 'DisplayName', 'C_{X2}');
title('X2: Decadimento ai lati'); xlabel('\tau [s]'); legend; grid on;

% Stampa dei parametri per Segnale 2
fprintf('--- Parametri Ordine 1 Segnale 2 ---\n');
fprintf('Media: %.4f | Potenza: %.4f | Varianza: %.4f\n', mean(X2(:)), mean(X2(:).^2), var(X2(:)));