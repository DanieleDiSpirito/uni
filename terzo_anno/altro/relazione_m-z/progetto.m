%% Generazione Onda Sinusoidale

clc;
clear all;
close all;

N = 256;                        % n punti campionati
f = 50;                         % frequenza componente fondamentale
M = 2;                          % n periodi considerati

K = [1];                        % vettore ordini armonici
A = [5];                        % vettore ampiezze armoniche
P = [0];                        % vettore fasi armoniche (rad)

T = 1 / f;

NP = N / M;                     % n campionamenti per periodo
Tcc = T / NP;                   % n secondi per campionamento

fc = N * f / M;                 % n campionamenti in 1 secondo 
df = fc / N;
delta = f / df - floor(f / df);

n0 = 0;                         % n ordine p. iniziale
LK = length(K);
n = (n0:n0 + N - 1);
Tc = 1 / fc;                    % periodo campionamento
t = Tc * n;                     % campionamento rispetto al tempo
ka = 2 * pi * f / fc;

x0 = 0;
for j = 1:LK
	c = A(j) * sin(ka * K(j) * n + P(j));
	x0 = x0 + c;
end

figure(1);
stem(x0, 'k');
title('segnale ingresso');

% Valore medio e Valore efficace

Vm = mean(x0)
Veff = rms(x0)

% Spettro Segnale

S = fft(x0);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(2);
stem(assex, B(1, :) ./ N);
title('spettro segnale');

% Distribuzione Gaussiana

% Introduzione Rumore (media = 0, deviazione standard = 1/3 di A)

u = 0;                          % media
o = A(1) * 1 / 3;               % deviazione standard
n = u + o * randn(1, N);
xn = x0 + n;

figure(3);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum1g = mean(xn)
Veff_rum1g = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(4);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');

% Introduzione Rumore (media = 3, deviazione standard = 2/3 di A)

u = 3;                          % media
o = A(1) * 2 / 3;               % deviazione standard
n = u + o * randn(1, N);
xn = x0 + n;

figure(5);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum2g = mean(xn)
Veff_rum2g = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(6);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');

% Distribuzione Uniforme

% Introduzione Rumore (media = 0, deviazione standard = 1/3 di A)

u = 0;                          % media
o = A(1) * 1 / 3;               % deviazione standard
b = u + o * sqrt(12) / 2;       % estremo superiore
a = u - o * sqrt(12) / 2;       % estremo inferiore
n = a + (b - a) .* rand(1, N);
xn = x0 + n;

figure(7);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum1u = mean(xn)
Veff_rum1u = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(8);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');

% Introduzione Rumore (media = 3, deviazione standard = 2/3 di A)

u = 3;                          % media
o = A(1) * 2 / 3;               % deviazione standard
b = u + o * sqrt(12) / 2;       % estremo superiore
a = u - o * sqrt(12) / 2;       % estremo inferiore
n = a + (b - a) .* rand(1, N);
xn = x0 + n;

figure(9);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum2u = mean(xn)
Veff_rum2u = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(10);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');

% Raddrizzamento

% Onda Sinusoidale con Raddrizzamento a Singola Semionda

xs = max(0, x0);                % segnale a singola semionda

figure(11), plot(xs, 'k');
title ('onda sinusoidale con raddrizzamento a singola semionda');

Vmean_sin = mean(xs)
Veff_sin = rms(xs)

% Spettro Onda Sinusoidale con Raddrizzamento a Singola Semionda

Ads = fft(xs);
Bds = abs(Ads);
len = N / 2;
Bds = [Bds(1) 2 * Bds(2:len)];  % ripiegamento in frequenza
[ads] = max(Bds);
assex = (0:len - 1) * df;

figure(12), stem(assex, Bds(1, :) ./ N);
title('spettro onda sinusoidale con raddrizzamento a singola semionda');

% Onda Sinusoidale con Raddrizzamento a Doppia Semionda

xrr = abs(x0);                  % segnale a doppia semionda

figure(13), plot(xrr, 'k');
title('onda sinusoidale con raddrizzamento a doppia semionda');

Vmean_double = mean(xrr)
Veff_double = rms(xrr)

% Spettro Onda Sinusoidale con Raddrizzamento a Doppia Semionda

Ads = fft(xrr);
Bds = abs(Ads);
len = N / 2;
Bds = [Bds(1) 2 * Bds(2:len)];  % ripiegamento in frequenza
[ads] = max(Bds);
assex = (0:len - 1) * df;

figure(14), stem(assex, Bds(1, :) ./ N);
title('spettro onda sinusoidale con raddrizzamento a doppia semionda');


%% Generazione Onda Multiarmonica

clc;
clear all;
close all;

N = 256;                        % n punti campionati
f = 50;                         % frequenza componente fondamentale
M = 2;                          % n periodi considerati

K = [1, 2, 5];                  % vettore ordini armonici
A = [3, 4, 5];                  % vettore ampiezze armoniche
P = [0, 0, 0];                  % vettore fasi armoniche (rad)

T = 1 / f;

NP = N / M;                     % n campionamenti per periodo
Tcc = T / NP;                   % n secondi per campionamento

fc = N * f / M;                 % n campionamenti in 1 secondo 
df = fc / N;
delta = f / df - floor(f / df);

n0 = 0;                         % n ordine p. iniziale
LK = length(K);
n = (n0:n0 + N - 1);
Tc = 1 / fc;                    % periodo campionamento
t = Tc * n;                     % campionamento rispetto al tempo
ka = 2 * pi * f / fc;

x0 = 0;
for j = 1:LK
    c = A(j) * sin(ka * K(j) * n + P(j));
	x0 = x0 + c;
end

figure(1);
stem(x0, 'k');
title('segnale ingresso');

% Valore medio e Valore efficace

Vm = mean(x0)
Veff = rms(x0)

% Spettro Segnale

S = fft(x0);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(2);
stem(assex, B(1, :) ./ N);
title('spettro segnale');

% Distribuzione Gaussiana

% Introduzione Rumore (media = 0, deviazione standard = 1/3 di A)

u = 0;                          % media
o = max(A) * 1 / 3;             % deviazione standard
n = u + o * randn(1, N);
xn = x0 + n;

figure(3);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum1g = mean(xn)
Veff_rum1g = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(4);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');

% Introduzione Rumore (media = 3, deviazione standard = 2/3 di A)

u = 3;                          % media
o = max(A) * 2 / 3;             % deviazione standard
n = u + o * randn(1, N);
xn = x0 + n;

figure(5);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum2g = mean(xn)
Veff_rum2g = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(6);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');

% Distribuzione Uniforme

% Introduzione Rumore (media = 0, deviazione standard = 1/3 di A)

u = 0;                          % media
o = max(A) * 1 / 3;             % deviazione standard
b = u + o * sqrt(12) / 2;       % estremo superiore
a = u - o * sqrt(12) / 2;       % estremo inferiore
n = a + (b - a) .* rand(1, N);
xn = x0 + n;

figure(7);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum1u = mean(xn)
Veff_rum1u = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(8);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');

% Introduzione Rumore (media = 3, deviazione standard = 2/3 di A)

u = 3;                          % media
o = max(A) * 2 / 3;             % deviazione standard
b = u + o * sqrt(12) / 2;       % estremo superiore
a = u - o * sqrt(12) / 2;       % estremo inferiore
n = a + (b - a) .* rand(1, N);
xn = x0 + n;

figure(9);
stem(xn, 'k');
title('segnale ingresso con rumore');

% Valore medio e Valore efficace con Rumore

Vm_rum2u = mean(xn)
Veff_rum2u = rms(xn)

% Spettro Segnale con Rumore

S = fft(xn);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(10);
stem(assex, B(1, :) ./ N);
title('spettro segnale con rumore');


%% Generazione Onda Quadra

clc;
clear all;
close all;

N = 256;                        % n punti campionati
f = 50;                         % frequenza componente fondamentale
M = 2;                          % n periodi considerati

A = 3;                          % vettore ampiezze armoniche

T = 1 / f;

NP = N / M;                     % n campionamenti per periodo
Tcc = T / NP;                   % n secondi per campionamento

fc = N * f / M;                 % n campionamenti in 1 secondo 
df = fc / N;
delta = f / df - floor(f / df);

n0 = 0;                         % n ordine p. iniziale
n = (n0:n0 + N - 1);
Tc = 1 / fc;                    % periodo campionamento
t = Tc * n;                     % campionamento rispetto al tempo

x0 = 0;
c = A * square(2 * pi * f * t); % segnale
x0 = x0 + c;

figure(1);
stem(x0, 'k');
title('segnale ingresso');

% Valore medio e Valore efficace

Vm = mean(x0)
Veff = rms(x0)

% Spettro Segnale

S = fft(x0);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(2);
stem(assex, B(1, :) ./ N);
title('spettro segnale');

% Raddrizzamento

% Onda Quadra con Raddrizzamento a Singola Semionda

xs = max(0, x0);                % segnale a singola semionda

figure(3), plot(xs, 'k');
title ('onda quadra con raddrizzamento a singola semionda');

Vmean_sin = mean(xs)
Veff_sin = rms(xs)

% Spettro Onda Quadra con Raddrizzamento a Singola Semionda

Ads = fft(xs);
Bds = abs(Ads);
len = N / 2;
Bds = [Bds(1) 2 * Bds(2:len)];  % ripiegamento in frequenza
[ads] = max(Bds);
assex = (0:len - 1) * df;

figure(4), stem(assex, Bds(1, :) ./ N);
title('spettro onda quadra con raddrizzamento a singola semionda');

% Onda Quadra con Raddrizzamento a Doppia Semionda

xrr = abs(x0);                  % segnale a doppia semionda

figure(5), plot(xrr, 'k');
title('onda quadra con raddrizzamento a doppia semionda');

Vmean_double = mean(xrr)
Veff_double = rms(xrr)

% Spettro Onda Quadra con Raddrizzamento a Doppia Semionda

Ads = fft(xrr);
Bds = abs(Ads);
len = N / 2;
Bds = [Bds(1) 2 * Bds(2:len)];  % ripiegamento in frequenza
[ads] = max(Bds);
assex = (0:len - 1) * df;

figure(6), stem(assex, Bds(1, :) ./ N);
title('spettro onda quadra con raddrizzamento a doppia semionda');


%% Generazione Onda Triangolare

clc;
clear all;
close all;

N = 256;                        % n punti campionati
f = 50;                         % frequenza componente fondamentale
M = 2;                          % n periodi considerati

A = 3;                          % vettore ampiezze armoniche

T = 1 / f;

NP = N / M;                     % n campionamenti per periodo
Tcc = T / NP;                   % n secondi per campionamento

fc = N * f / M;                 % n campionamenti in 1 secondo 
df = fc / N;
delta = f / df - floor(f / df);

n0 = 0;                         % n ordine p. iniziale
n = (n0:n0 + N - 1);
Tc = 1 / fc;                    % periodo campionamento
t = Tc * n;                     % campionamento rispetto al tempo

x0 = 0;
c = A * sawtooth(2 * pi * f * (t + N / (M * 4) * Tc), 0.5); % segnale
x0 = x0 + c;

figure(1);
stem(x0, 'k');
title('segnale ingresso');

% Valore medio e Valore efficace

Vm = mean(x0)
Veff = rms(x0)

% Spettro Segnale

S = fft(x0);
B = abs(S);
len = N / 2;
B = [B(1) 2 * B(2:len)];        % ripiegamento in frequenza
[a] = max(B);
assex = (0:len - 1) * df;

figure(2);
stem(assex, B(1, :) ./ N);
title('spettro segnale');

% Raddrizzamento

% Onda Triangolare con Raddrizzamento a Singola Semionda

xs = max(0, x0);                % segnale a singola semionda

figure(3), plot(xs, 'k');
title ('onda triangolare con raddrizzamento a singola semionda');

Vmean_sin = mean(xs)
Veff_sin = rms(xs)

% Spettro Onda Triangolare con Raddrizzamento a Singola Semionda

Ads = fft(xs);
Bds = abs(Ads);
len = N / 2;
Bds = [Bds(1) 2 * Bds(2:len)];  % ripiegamento in frequenza
[ads] = max(Bds);
assex = (0:len - 1) * df;

figure(4), stem(assex, Bds(1, :) ./ N);
title('spettro onda triangolare con raddrizzamento a singola semionda');

% Onda Triangolare con Raddrizzamento a Doppia Semionda

xrr = abs(x0);                  % segnale a doppia semionda

figure(5), plot(xrr, 'k');
title('onda triangolare con raddrizzamento a doppia semionda');

Vmean_double = mean(xrr)
Veff_double = rms(xrr)

% Spettro Onda Triangolare con Raddrizzamento a Doppia Semionda

Ads = fft(xrr);
Bds = abs(Ads);
len = N / 2;
Bds = [Bds(1) 2 * Bds(2:len)];  % ripiegamento in frequenza
[ads] = max(Bds);
assex = (0:len - 1) * df;

figure(6), stem(assex, Bds(1, :) ./ N);
title('spettro onda triangolare con raddrizzamento a doppia semionda');