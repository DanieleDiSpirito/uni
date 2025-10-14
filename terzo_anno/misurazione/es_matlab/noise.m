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
y_noise = sqrt(A) * randn(1, N);

y = y_signal + y_noise;
stem(t, y);
hold on;
stem(t, y_signal);
pause;
hold off;

histogram(y_noise, "NumBins", 25, "Normalization", "pdf");
pause;

spectrum = fft(y_noise);
power = abs(spectrum/N).^2;
power_positive_part = power(1:N/2+1);
log10_power = 10 * log10(power_positive_part);
frequencies = fc * (0:(N/2))/N;
plot(frequencies, log10_power);
hold on;
grid on;
pwelch(y_noise, [], [], [], fc);
pwelch(y, [], [], [], fc);
legend("Plot from fft", "pwelch noise", "pwelch signal with noise");
