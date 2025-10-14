hold off;
clear;

N = 1024; % number of points
T = 1; % period [ms]
f = 1/T; % frequency [KHz]
M = 2; % number of period
t = linspace(0, M*T, N);

Tc = (M*T) / N; % sampling period [ms]
fc = 1/Tc; % sampling frequency [KHz]

A = 5; % amplitude of no noise signal
y_signal = A * sin(2*pi*f*t);

% Quantization
bit = 3;
M = 2^bit;
Q = 2/M;
y_quant = Q * floor(y_signal / Q);
quant_error = y_signal - y_quant;

stem(t, y_signal);
hold on;
stem(t, y_quant);
stem(t, quant_error);
legend("Signal", "Quant", "Quant error");
pause;
hold off;

histogram(quant_error, "NumBins", 25, "Normalization", "pdf");
pause;

spectrum = fft(quant_error);
power = abs(spectrum/N).^2; % density
power_positive_part = power(1:N/2+1);
log10_power = 10 * log10(power_positive_part);
frequencies = fc * (0:(N/2))/N;
plot(frequencies, log10_power);
hold on;
grid on;
pwelch(quant_error, [], [], [], fc);
pwelch(y_signal, [], [], [], fc);
legend("Plot from fft", "pwelch quant error", "pwelch signal");
