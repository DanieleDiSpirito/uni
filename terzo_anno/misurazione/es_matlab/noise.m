clear;
rng default;

N = 1024; % number of points
T = 1; % period [ms]
f = 1/T; % frequency [KHz]
M = 2; % number of period
t = linspace(0, M*T, N);

Tc = (M*T) / N; % sampling period [ms]
fc = 1/Tc; % sampling frequency [KHz]

A = 5; % amplitude of no noise signal
y_signal = A * (-1).^(floor(t/(T/2)));
y_noise = randn(1, N);

y = y_signal + y_noise;
stem(t, y);
hold on;
stem(t, y_signal);
pause;
hold off;

histogram(y_noise, "NumBins", 25, "Normalization", "pdf");
pause;

spectrum = abs(fft(y_noise));
frequencies = linspace(0, fc, N);
plot(frequencies, spectrum);