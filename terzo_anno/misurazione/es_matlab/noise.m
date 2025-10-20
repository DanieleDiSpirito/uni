hold off;
clear;
rng shuffle;
subplot(1, 1, 1);

N = 1024; % number of points
T = 1; % period [ms]
f = 1/T; % frequency [KHz]
M = 2; % number of period
t = linspace(0, M*T, N);

Tc = (M*T) / N; % sampling period [ms]
fc = 1/Tc; % sampling frequency [KHz]

A = 5; % amplitude of no noise signal
y_signal = A * sin(2*pi*f*t);
y_noise = (A/3) * randn(1, N);

y = y_signal + y_noise;
plot(t, y);
hold on;
plot(t, y_signal);
pause;
hold off;

histogram(y_noise, "NumBins", 25, "Normalization", "pdf");
pause;

spectrum = fft(y);
B = abs(spectrum);
frequencies = fc/N * (1:N/2);
B = [B(1) 2*B(2:N/2)];
subplot(2, 1, 1);
plot(frequencies, B / N)
title("Spectrum");

subplot(2, 1, 2);
grid on;
hold on;
pwelch(y, [], [], [], fc);
pwelch(y_noise, [], [], [], fc);
legend("Plot from fft", "pwelch noise", "pwelch signal with noise");
