%% QUESITO 1
% La potenza attiva assorbita da un carico monofase è data da:
%
%     P = V * I * cos(phi)
%
% - V è il valore efficace della tensione ai capi del carico,
% - I è il valore efficace della corrente che lo attraversa,
% - phi è lo sfasamento tra tensione e corrente.
%
% Calcolare le incertezze assolute di caso peggiore assoluta e relativa nella misura della potenza P.
% 
% Attenzione: rispondere esattamente a tutte le domande di questo quesito è condizione NECESSARIA per superare la prova
% scritta. Se una di queste risposte è errata o mancante, la prova scritta non può essere superata.

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

V = 230.0     % tensione (volt)
I = 5.00      % corrente (ampere)

phi_deg = 30  % sfasamento espresso in gradi (non in radianti)

UV = 0.5      % incertezza di caso peggiore di V
UI = 0.02     % incertezza di caso peggiore di I
Uphi_deg = 0.5 % incertezza di caso peggiore di theta espressa in gradi (non in radianti)

%==============================
% Domande
% cV = % coefficiente di sensibilità ASSOLUTO di P rispetto a V 
% cI = % coefficiente di sensibilità ASSOLUTO di P rispetto a I 
% cphi = % coefficiente di sensibilità ASSOLUTO di P rispetto a theta 
% UP = % incertezza assoluta sulla potenza
% UrP = % incertezza relativa sulla potenza


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% % Da gradi a radianti
% phi = phi_deg/180*pi
% Uphi = Uphi_deg/180*pi
% 
% % Coefficienti assoluti di sensibilità
% cV = I*cos(phi)
% cI = V*cos(phi)
% cphi = -V*I*sin(phi)
% 
% % Incertezza assoluta di caso peggiore
% UP = abs(cV)*UV + abs(cI)*UI + abs(cphi)*Uphi
% 
% % Potenza misurata
% P = V*I*cos(phi)
% 
% % Incertezza relativa di caso peggiore
% UrP = UP / abs(P)
% disp('=============================')

%% RISPOSTA QUESITO 1

% Y = 5
% N = 0
% X = 0

phi = phi_deg * pi / 180

P = V * I * cos(phi)

cV = I * cos(phi) % coefficiente di sensibilità ASSOLUTO di P rispetto a V 
% Y

cI = V * cos(phi)  % coefficiente di sensibilità ASSOLUTO di P rispetto a I 
% Y

cphi = -V*I*sin(phi) % coefficiente di sensibilità ASSOLUTO di P rispetto a theta 
% Y

Uphi = Uphi_deg * pi / 180

UP = abs(cV)*UV + abs(cI)*UI + abs(cphi)*Uphi % incertezza assoluta sulla potenza
% Y

UrP = UP / abs(P) % incertezza relativa sulla potenza
% Y




%% QUESITO 2
% Con riferimento al quesito precedente, si calcoli la propagazione dell'incertezza standard e l'incertezza estesa. Si
% faccia uso dei dati forniti qui (che non coincidono con le soluzioni del quesito precedente)
%
% Si tenga presente che:
% - l'errore sulla misura di V ha distribuzione RETTANGOLARE
% - l'errore sulla misura di I ha distribuzione ARCOSENO
% - l'errore sulla misura di theta ha distribuzione TRIANGOLARE SIMMETRICA
%
%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

UV = 0.1     % incertezza di caso peggiore di V
UI = 0.2     % incertezza di caso peggiore di I
Uphi_deg = 0.1 % incertezza di caso peggiore di theta espressa in gradi (non in radianti)

cV = 3 % coefficiente di sensibilità ASSOLUTO di P rispetto a V 
cI = 100 % coefficiente di sensibilità ASSOLUTO di P rispetto a I 
cphi = -400 % coefficiente di sensibilità ASSOLUTO di P rispetto a theta 

k = 2.5 % fattore di copertura dell'incertezza estesa

%==============================
% Domande
% uV = % incertezza standard sulla misura di V
% uI = % incertezza standard sulla misura di I
% uphi = % incertezza standard sulla misura di theta
% uP = % incertezza standard sulla misura di P
% UEP = % incertezza estesa sulla misura di P
% cp = % probabilità di copertura dell'incertezza estesa


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% % Da gradi a radianti
% Uphi = Uphi_deg/180*pi
% 
% % Conversione da incertezza di caso peggiore a incertezza standard per le grandezze in ingresso
% uV = UV/sqrt(3) % pdf rettangolare
% uI = UI/sqrt(2) % pdf arcoseno
% uphi = Uphi/sqrt(6) % pdf triangolare simmetrica
% 
% % Incertezza standard assoluta
% uP = sqrt((cV*uV)^2 + (cI*uI)^2 + (cphi*uphi)^2)
% 
% % Incertezza estesa assoluta
% UEP = k*uP
% 
% % Probabilità di copertura
% cp = 2*normcdf(k) - 1
% disp('=============================')

%% RISPOSTA QUESITO 2

% Y = 6
% N = 0
% X = 0

uV = UV / sqrt(3) % incertezza standard sulla misura di V
% Y

uI = UI / sqrt(2) % incertezza standard sulla misura di I
% Y

Uphi = Uphi_deg * pi / 180

uphi = Uphi / sqrt(6) % incertezza standard sulla misura di theta
% Y

uP = sqrt(cV^2*uV^2 + cI^2*uI^2 + cphi^2*uphi^2) % incertezza standard sulla misura di P
% Y

UEP = uP * k % incertezza estesa sulla misura di P
% Y

cp = 2*normcdf(k) - 1 % probabilità di copertura dell'incertezza estesa
% Y




%% QUESITO 3
% Con riferimento al modello della misurazione P = V*I*cos(theta), calcolare i coefficienti relativi di sensibilità, e
% la matrice dei coefficienti relativi.
%
% Per scrivere la matrice, l'ordine delle variabili in ingresso è [V; I; phi].

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

V = 230.0     % tensione (volt)
I = 5.00      % corrente (ampere)
phi_deg = 30  % sfasamento espresso in gradi (non in radianti)

%==============================
% Domande
% crV = % coefficiente relativo di sensibilità di P rispetto a V
% crI = % coefficiente relativo di sensibilità di P rispetto a I
% crphi = % coefficiente relativo di sensibilità di P rispetto a theta
% Cr = % matrice dei coefficienti relativi di sensibilità


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% % Da gradi a radianti
% phi = phi_deg/180*pi
% 
% % Coefficienti di sensibilità relativi
% crV = 1
% crI = 1
% crphi = -sin(phi)/cos(phi)*phi % anche -tan(theta)*theta
% 
% % Matrice dei coefficienti di sensibilità relativi
% Cr = [crV, crI, crphi]
% disp('=============================')

%% RISPOSTA QUESITO 3

% Y = 4
% N = 0
% X = 0

phi = phi_deg * pi / 180

crV = 1 % coefficiente relativo di sensibilità di P rispetto a V
% Y

crI = 1 % coefficiente relativo di sensibilità di P rispetto a I
% Y

crphi = - phi * tan(phi) % coefficiente relativo di sensibilità di P rispetto a theta
% Y

Cr = [crV, crI, crphi] % matrice dei coefficienti relativi di sensibilità
% Y




%% QUESITO 4
% Per ciascuna delle grandezze riportate qui sotto, eseguire la conversione
% nell'unità di misura indicata, esprimendo il risultato come valore numerico.

% Le quantità iniziali sono:
% - x1: concentrazione espressa in percentuale (%)
% - x2: concentrazione espressa in permille (‰)
% - x3: concentrazione espressa in parti per milione (ppm)
% - x4: accelerazione in m/s²
% - x5: temperatura in gradi Fahrenheit (°F)

% Le unità di destinazione sono:
% - y1: parti per milione (ppm)
% - y2: percentuale (%)
% - y3: percentuale (%)
% - y4: m/ms²
% - y5: gradi Celsius (°C)

% Per la conversione di temperatura si ricorda che:
% 0 °C corrisponde a 32 °F
% 100 °C corrisponde a 212 °F

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

x1 = 0.75      % percento
x2 = 8.5       % permille
x3 = 4200      % ppm
x4 = 9.81      % m/s²
x5 = 98.6      % gradi Fahrenheit

%==============================
% Domande
% y1 = % valore in ppm corrispondente a x1
% y2 = % valore in percentuale corrispondente a x2
% y3 = % valore in percentuale corrispondente a x3
% y4 = % accelerazione in m/ms² corrispondente a x4
% y5 = % temperatura in gradi Celsius corrispondente a x5


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% y1 = x1 * 1e4        % 1 % = 1e4 ppm
% y2 = x2 / 10         % 1 ‰ = 0.1 %
% y3 = x3 * 1e-4       % 1 ppm = 1e-4 %
% y4 = x4 * 1e-6       % 1 s² = (1000 ms)² = 1e6 ms² -> m/s² = 1e-6 m/ms²
% y5 = (x5 - 32) * 5/9 % formula di conversione da °F a °C
% disp('=============================')

%% RISPOSTA QUESITO 4

% Y = 5
% N = 0
% X = 0

y1 = x1 * 1e4 % valore in ppm corrispondente a x1
% Y

y2 = x2 / 10 % valore in percentuale corrispondente a x2
% Y

y3 = x3 * 1e-4 % valore in percentuale corrispondente a x3
% Y

y4 = x4 * 1e-6 % accelerazione in m/ms² corrispondente a x4
% Y

y5 = (x5 - 32) / ((212-32)/100) % temperatura in gradi Celsius corrispondente a x5
% Y




%% QUESITO 5
% Come si esprimono il coulomb, il volt, il weber e il tesla in termini delle unità base del Sistema Internazionale?

% Si ricorda che le unità base sono metro (m), kilogrammo (kg), secondo (s), ampere (A), kelvin (K), mole (mol), candela
% (cd).
%
% Suggerimento: per ricavare il weber, unità del flusso magnetico φ, si può usare la legge di Faraday–Lenz (v = dφ/dt),
% mentre per ricavare il tesla, unità dell'induzione magnetica B, si può considerare la definizione B = φ / S, con S
% superficie.

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

syms m kg s A K mol % unità base del SI, esclusa la candela

%==============================
% Domande
% C = % esprimere il coulomb in unità base del SI
% V = % esprimere il volt in unità base del SI
% Wb = % esprimere il weber in unità base del SI
% T = % esprimere il tesla in unità base del SI


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% % Coulomb (carica): Q = I * t
% C = A * s % coulomb = ampere * secondo
% 
% % Newton, joule e watt come passaggi intermedi
% N = kg * m / s^2
% J = N * m
% W = J / s
% 
% % Volt: V = W / A
% V = W / A % = kg * m^2 * s^-3 * A^-1
% 
% % Weber: Φ = V * s
% Wb = V * s % = kg * m^2 * s^-2 * A^-1
% 
% % Tesla: B = Φ / m^2
% T = Wb / m^2 % = kg * s^-2 * A^-1
% disp('=============================')

%% RISPOSTA QUESITO 5

% Y = 4
% N = 0
% X = 0

C = A * s % esprimere il coulomb in unità base del SI
% Y

N = kg * m * s^-2 % F = ma

J = N*m % L = F*dx

W = J/s % P = dL/dt

V = W/A % esprimere il volt in unità base del SI
% Y

Wb = V * s % esprimere il weber in unità base del SI
% Y

T = Wb * m^-2 % esprimere il tesla in unità base del SI
% Y




%% QUESITO 6
% Si applicano ai capi di una resistenza tensioni assegnate v (note senza incertezza)
% e si misurano le correnti i, affette da errori i.i.d. a distribuzione uniforme.
% Si assuma il modello
%
% i = P/v
%
% e si calcoli:
% - la stima OLS di P;
% - la stima OLS delle correnti i_hat, e i residui e_hat;
% - l'incertezza standard di tipo A in ingresso (u0) dalle correnti;
% - l'incertezza di caso peggiore in ingresso (U0), in base a u0;
% - l'incertezza standard (tipo A) e l'incertezza estesa sulla stima di P.
%
% Nota: v è esatta (nessuna incertezza su v). Tutta l'incertezza proviene
% dalle misure di i (errori i.i.d a distribuzione uniforme).
%
%==============================
% Dati, e codice che li genera (NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

N = 12; % numero di misure
% v = % tensioni in volt (esatte, assegnate)
% i = % misure di corrente in ampere, affette da errori i.i.d. a pdf rettangolare
k = 2; % fattore di copertura da applicare per il calcolo dell'incertezza estesa

vmin = 10; vmax = 120; Ptrue = 5;

v = linspace(vmin, vmax, N)';
i = Ptrue./v + unifrnd(-8e-2, 8e-2, size(v));
% plot(v, i, '-o'), grid, xlabel('tensione v /V'), ylabel('corrente i /A'), title('Modello i = P/v, con v esatta')

clearvars vmin vmax Ptrue

%==============================
% Domande
% A = % matrice dei regressori
% C = % matrice pseudoinversa sinistra della matrice dei regressori
% P_hat = % stima OLS della potenza in watt
% i_hat = % vettore colonna delle stime della corrente in ampere
% e_hat = % residui
% nu = % gradi di liberta' del residuo
% u0 = % incertezza standard di tipo A in ingresso (correnti)
% U0 = % incertezza di caso peggiore in ingresso (correnti)
% uP = % incertezza standard (tipo A) sulla stima di P
% UE_P = % incertezza estesa assoluta sulla stima di P
% cp = % probabilita' di copertura (tipo A) corrispondente al fattore k
% cp_circa_95 = % domanda sul valore di cp

%==============================
% Nota
% All'ultima domanda bisogna rispondere:
% cp_circa_95 = "vero" % se cp è circa pari al 95% (non minore di 94% e non maggiore di 96%)
% cp_circa_95 = "falso" % in caso contrario


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% A = 1./v;                 % matrice dei regressori (una colonna)
% C = (A'*A)^-1 * A';       % pseudoinversa sinistra
% 
% P_hat = C * i             % stima OLS di P (watt)
% i_hat = A * P_hat;        % stima OLS delle correnti
% e_hat = i - i_hat;        % residui
% 
% nu = N - 1                % g.d.l. del residuo (1 parametro stimato)
% 
% % Incertezza standard tipo A in ingresso (correnti) dai residui
% u0 = sqrt(sum(e_hat.^2) / nu)   
% 
% % Incertezza di caso peggiore tipo A in ingresso (correnti) dai residui
% U0 = u0*sqrt(3) % semirange della distribuzione uniforme degli errori, sapendo che la pdf è uniforme
% 
% % Matrice covarianza del parametro OLS (un parametro): var(P_hat) = u0^2 * (A'*A)^-1
% Sigma_theta = (A'*A)^-1 * u0^2;
% uP = sqrt(Sigma_theta)          % incertezza standard su P (watt)
% 
% % Incertezza estesa su P
% UE_P = k * uP                  % incertezza estesa assoluta (watt)
% 
% % Probabilita' di copertura
% cp = 2*tcdf(k,nu) - 1
% 
% cp_circa_95 = "falso"
% disp('=============================')

%% RISPOSTA QUESITO 6

% Y = 11
% N = 1
% X = 0

P = i.*v

A = [v.^-1] % matrice dei regressori
% Y

Q = (A'*A)^-1

C = Q*A' % matrice pseudoinversa sinistra della matrice dei regressori
% Y

P_hat = C*i % stima OLS della potenza in watt
% Y

i_hat = A*P_hat % vettore colonna delle stime della corrente in ampere
% Y

e_hat = i - i_hat % residui
% Y

nu = N - 1 % gradi di liberta' del residuo
% Y

SSR = sum(e_hat.^2)

u0 = sqrt(SSR/nu) % incertezza standard di tipo A in ingresso (correnti)
% Y

U0 = u0 * sqrt(3) % incertezza di caso peggiore in ingresso (correnti)
% Y

uP = u0^2 * Q % incertezza standard (tipo A) sulla stima di P
% N

UE_P = uP * k % incertezza estesa assoluta sulla stima di P
% Y

cp = 2*tcdf(k, nu) - 1 % probabilita' di copertura (tipo A) corrispondente al fattore k
% Y

cp_circa_95 = "falso" % domanda sul valore di cp
% Y




%% QUESITO 7
% fig_elevamento_portata_voltmetro.png

% Si ha un ADC con resistenza interna praticamente infinita (> 1 GΩ). l'ADC misura tensioni ed è quindi un voltmetro,
% con un certo fondo scala Vfs. Si vuole realizzare un voltmetro con fondo scala superiore Vfs1, mediante il circuito in
% figura.

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

syms Rp RV real

%==============================
% Domande
% k = % esprimere il rapporto k = Vfs1/Vfs in termini di Rp, RV
% RV1 = % esprimere la resistenza RV1 in termini di Rp, RV

%==============================
% Nota
% I dati, e le quantità richieste, sono variabili simboliche.


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% k = (RV + Rp)/RV
% RV1 = RV + Rp
% disp('=============================')

%% RISPOSTA QUESITO 7

% Y = 2
% N = 0
% X = 0

k = (Rp + RV) / RV % esprimere il rapporto k = Vfs1/Vfs in termini di Rp, RV
% Y

RV1 = Rp + RV % esprimere la resistenza RV1 in termini di Rp, RV
% Y




%% QUESITO 8
% Con riferimento al quesito precedente, calcolare le quantità richieste. 

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

Vfs = 0.1 % valore di fondo scala del voltmetro prima dell'elevamento della portata
Vfs1 = 0.5 % valore di fondo scala del voltmetro dopo l'elevamento della portata
RV1 = 10e6 % resistenza interna del voltmetro che si desidera realizzare, dopo l'elevamento della portata

Ur_RV = 0.002 % WCU relativa della resistenza RV
Ur_Rp = 0.001 % WCU relativa della resistenza Rp

Ur_V = 0.001 % WCU relativa delle misure di tensione del voltmetro originale, prima dell'elevamento della portata

%==============================
% Domande
% RV = % resistenza da inserire in parallelo al voltmetro
% Rp = % resistenza di "probe" da inserire
% cr_RV = % coefficiente relativo di sensibilità di k rispetto a RV
% cr_Rp = % coefficiente relativo di sensibilità di k rispetto a Rp
% Ur_k = % WCU relativa con cui è realizzato il rapporto k = Vfs1/Vfs mediante le resistenze Rp, RV
% Ur_V1 = % WCU relativa della misura di tensione del voltmetro, dopo l'elevamento della portata


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% k = Vfs1/Vfs % fattore nominale di elevamento della portata
% 
% RV = RV1/k
% Rp = RV*(k-1)
% 
% cr_RV = (1-k)/k % coefficiente relativo di sensibilità di k rispetto a RV
% cr_Rp = -cr_RV % coefficiente relativo di sensibilità di k rispetto a Rp
% 
% Ur_k = abs(cr_Rp)*Ur_Rp + abs(cr_RV)*Ur_RV
% Ur_V1 = Ur_k + Ur_V % perché V1 = k*V
% disp('=============================')

%% RISPOSTA QUESITO 8

% Y = 6
% N = 0
% X = 0

k = Vfs1/Vfs

RV = RV1/k % resistenza da inserire in parallelo al voltmetro
% Y

Rp = RV * (k - 1) % resistenza di "probe" da inserire
% Y

cr_RV = - Rp / (Rp + RV) % coefficiente relativo di sensibilità di k rispetto a RV
% Y

cr_Rp = -cr_RV % coefficiente relativo di sensibilità di k rispetto a Rp
% Y

Ur_k = abs(cr_RV) * Ur_RV + abs(cr_Rp) * Ur_Rp % WCU relativa con cui è realizzato il rapporto k = Vfs1/Vfs mediante le resistenze Rp, RV
% Y

Ur_V1 = Ur_k + Ur_V % WCU relativa della misura di tensione del voltmetro, dopo l'elevamento della portata
% Y




%% QUESITO 9
% fig_circuito_LR_con_FRF.png

% A un filtro LR si collegano generatore e oscilloscopio come in figura. Si misura sia la risposta al gradino, sia la
% risposta a un segnale sinusoidale (FRF con sinusoide single-tone).
%
% Quando si misura la risposta al gradino, l'ampiezza del gradino di tensione vgen(t) è pari a Vin.
%
% Quando si misura la FRF, la sinusoide in ingresso v1(t) ha valore picco-picco Vpp1, e il suo primo passaggio per lo
% zero è all'istante t1, come in figura.

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

R = 200 % resistenza del circuito (ohm)
L = 1e-4 % induttanza del circuito (H)
s = tf('s') % variabile s della trasformata di Laplace
f = 2e5 % frequenza del segnale sinusoidale (Hz)
Vin = 3.5 % ampiezza del gradino vgen(t), nella misura di risposta al gradino
Vpp1 = 4 % valore picco-picco della sinusoide in ingresso v1(t), nella misura di FRF
t1 = 9e-7 % istante del primo passaggio per lo zero di v1(t), nella misura di FRF

%==============================
% Domande
% Hdot1 = % funzione di trasferimento misurando la risposta al gradino, calcolata in s
% fc1 = % frequenza di taglio teorica di Hdot1 (Hz)
% Vout = % valore finale della risposta al gradino misurata all'uscita
% Hdot = % funzione di trasferimento misurando la risposta a una sinusoide single-tone, calcolata in s
% fc = % frequenza di taglio teorica di Hdot (Hz)
% H = % risposta di ampiezza al segnale sinusoidale, alla frequenza f
% phiH = % risposta di fase al segnale sinusoidale, alla frequenza f
% Vpp2 = % tensione picco-picco della sinusoide in uscita
% dt = % shift temporale tra le sinusoidi in ingresso e in uscita, con lo stesso segno di phiH
% t2 = % istante di primo passaggio dallo zero della sinusoide in uscita

%==============================
% Note La risposta al gradino è misurata osservando la tensione v2(t), e considerando vgen(t) un gradino ideale. La FRF
% è misurata confrontando le tensioni v2(t) e v1(t).
%
% La resistenza Rgen ha il valore standard del generatore utilizzato in laboratorio.


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% Rgen = 50
% R1 = R + Rgen
% 
% tau = L/R
% tau1 = L/R1
% k1 = R/R1
% 
% Hdot1 = k1/(1+s*tau1)
% fc1 = 1/(2*pi*tau1)
% 
% Vout = Vin*k1
% 
% Hdot = 1/(1+s*tau)
% fc = 1/(2*pi*tau)
% 
% H = 1/sqrt(1+(f/fc)^2)
% phiH = - atan(f/fc)
% 
% Vpp2 = Vpp1*H
% dt = phiH/(2*pi*f)
% t2 = t1 -dt
% disp('=============================')

%% RISPOSTA QUESITO 9

% Y = 9
% N = 1
% X = 0

Rgen = 50

R1 = R + Rgen

k1 = R/R1

tau1 = L/R1

tau = L/R

Hdot1 = k1 / (1 + s*tau1) % funzione di trasferimento misurando la risposta al gradino, calcolata in s
% Y

fc1 = 1/(2*pi*tau1) % frequenza di taglio teorica di Hdot1 (Hz)
% Y

Vout = Vin * k1 % valore finale della risposta al gradino misurata all'uscita
% Y

Hdot = 1/ (1 + s*tau) % funzione di trasferimento misurando la risposta a una sinusoide single-tone, calcolata in s
% Y

fc = 1/(2*pi*tau) % frequenza di taglio teorica di Hdot (Hz)
% Y

H = 1 / sqrt(1 + (f/fc)^2) % risposta di ampiezza al segnale sinusoidale, alla frequenza f
% Y

phiH = -atan(f/fc) % risposta di fase al segnale sinusoidale, alla frequenza f
% Y

Vpp2 = Vpp1 * H % tensione picco-picco della sinusoide in uscita
% Y

dt = -phiH / (2*pi*f) % shift temporale tra le sinusoidi in ingresso e in uscita, con lo stesso segno di phiH
% N

t2 = t1 - dt % istante di primo passaggio dallo zero della sinusoide in uscita
% Y




%% QUESITO 10
% Con riferimento al circuito LR precedente, e alle sinusoidi misurate in ingresso e in uscita, si misuri la risposta di
% fase e la frequenza di taglio, valutando l'incertezza STANDARD. Gli errori su t1, t2, f sono indipendenti.

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

t1 = 10e-7 % istante di attraversamento dello zero della sinusoide in ingresso (s)
t2 = 15e-7 % istante di attraversamento dello zero della sinusoide in uscita (s)
f = 1e5 % frequenza della sinusoide (Hz)
R = 120 % valore della resistenza (ohm)

U_t1 = 5e-10 % incertezza assoluta nella misura di t1
U_t2 = 6e-10 % incertezza assoluta nella misura di t2

Ur_f = 0.5e-3 % incertezza relativa nella misura di f
Ur_R = 1e-3 % incertezza relativa nella misura di R

%==============================
% Domande
% phiH = % risposta di fase misurata
% fc = % frequenza di taglio misurata dalla risposta di fase
% ur_dt = % incertezza standard relativa di dt
% ur_phiH = % incertezza standard relativa di phiH
% cr_fc_dt = % coefficiente di sensibilità relativo di fc rispetto a dt
% cr_fc_f = % coefficiente di sensibilità relativo di fc rispetto a f
% Cr = % matrice dei coefficienti relativi di sensibilità di fc rispetto a x = [dt;f]
% ur_fc = % incertezza standard di fc
% L = % induttanza del circuito LR misurata dalla risposta di ampiezza phiH
% ur_L = % incertezza standard di L


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% % Da WCU a SU
% u_t1 = U_t1/sqrt(3);
% u_t2 = U_t2/sqrt(3);
% ur_f = Ur_f/sqrt(3);
% ur_R = Ur_R/sqrt(3);
% 
% dt = t1 - t2; % sfasamento temporale tra le sinusoidi, con lo stesso segno della risposta di fase
% phiH = 2*pi*dt*f % risposta di fase misurata
% fc = f/tan(-phiH) % frequenza di taglio misurata dalla risposta di fase
% 
% u_dt = sqrt(u_t1^2 + u_t2^2); % perché dt = t1-t2
% ur_dt= u_dt/abs(dt) % calcolo incertezza relativa
% ur_phiH = sqrt(ur_dt^2 + ur_f^2) % perché phiH = 2*pi*dt*f
% 
% cr_fc_dt = -(4*dt*f*pi)/sin(4*pi*dt*f) % si calcola a mano o col symbolic toolbox
% cr_fc_f = (sin(4*pi*dt*f) - 4*pi*dt*f)/sin(4*pi*dt*f) % si calcola a mano o col symbolic toolbox
% Cr = [cr_fc_dt, cr_fc_f]
% 
% ur = [ur_dt;ur_f];
% ur_fc = sqrt(sum(Cr.^2*ur.^2))
% 
% ur_fc = sqrt(cr_fc_dt^2*ur_dt^2 + cr_fc_f^2*ur_f^2) % alternativa
% 
% L = R/(2*pi*fc)
% 
% ur_L = sqrt(ur_R^2 + ur_fc^2)
% disp('=============================')

%% RISPOSTA QUESITO 10

% Y = 9
% N = 1
% X = 0

dt = t1-t2

phiH = 2*pi*f * dt % risposta di fase misurata
% Y

fc = -f / tan(phiH) % frequenza di taglio misurata dalla risposta di fase
% Y

cr_t1 = t1/dt

cr_t2 = -t2/dt

Ur_t1 = U_t1 / abs(t1)

Ur_t2 = U_t2 / abs(t2)

ur_dt = sqrt(cr_t1^2 * Ur_t1^2/3 + cr_t2^2 * Ur_t2^2/3) % incertezza standard relativa di dt
% Y

ur_phiH = sqrt(ur_dt^2 + Ur_f^2/3) % incertezza standard relativa di phiH
% Y

syms dt_ f_ real

phi_ = 2*pi*f_*dt_

fc_ = - f_ / tan(phi_)

double(subs(simplify(diff(fc_, dt_) * dt_ / f_), [f_, dt_], [f, dt]))

cr_fc_dt = double(subs(simplify(diff(fc_, dt_) * dt_ / fc_), [f_, dt_], [f, dt]))% coefficiente di sensibilità relativo di fc rispetto a dt
% Y

cr_fc_f =double(subs(simplify(diff(fc_, f_) * f_ / fc_), [f_, dt_], [f, dt])) % coefficiente di sensibilità relativo di fc rispetto a f
% Y

Cr = [cr_fc_dt cr_fc_f] % matrice dei coefficienti relativi di sensibilità di fc rispetto a x = [dt;f]
% Y

ur = [ur_dt; Ur_f/sqrt(3)]

ur_fc = sqrt(Cr.^2 * ur.^2) % incertezza standard di fc
% Y

L = 1/(2*pi*fc*R) % induttanza del circuito LR misurata dalla risposta di ampiezza phiH
% N

ur_L = sqrt(Ur_R^2/3 + ur_fc^2)% incertezza standard di L
% Y




%% QUESITO 11
% Sono fornite le variabili aleatorie "errore di misura" e1 ed e2, come popolazioni di Nsim valori.
% 
% Rispondere alle domande che seguono, applicando le definizioni di WCU, di SU, di covarianza e di coefficiente di
% correlazione. Per calcolare i valori attesi, si usi l'operazione "mean".
% 
% Gli errori sono da considerarsi a media nulla. Quindi, nell'applicare le definizioni, le medie degli errori vanno
% sempre considerate uguali a zero. Ad esempio E[(X-mu)] = E[X].

%==============================
% Dati, e codice che li genera (il codice NON VA MAI RIPORTATO NELLA SOLUZIONE)
clear, clc

Nsim = 1e4; % numero di valori di errore
% e1 = vettore 1xNsim di valori di errore
% e2 = vettore 1xNsim di valori di errore

x = linspace(-4,4,Nsim);
a = x(randperm(Nsim));
b = x(randperm(Nsim));

e1 = a + b;
e2 = a - b;

clear x a b

%==============================
% Domande
% U1 = % incertezza di caso peggiore, per l'errore e1
% sigma1 = % incertezza standard, per l'errore e1
% pdf1 = % pdf dell'errore e1 (vedi nota)
% U2 = % incertezza di caso peggiore, per l'errore e2
% sigma2 = % incertezza standard, per l'errore e2
% pdf2 = % pdf dell'errore e2 (vedi nota)
% sigma12 = % covarianza degli errori e1, e2
% rho12 = % coefficiente di correlazione degli errori e1, e2
% incorrelati = % gli errori si possono considerare incorrelati?
% indipendenti = % gli errori si possono considerare indipendenti?

%==============================
% Nota sulla risposta alla domanda pdf1
% pdf1 = "unif" % pdf uniforme
% pdf1 = "tri" % pdf triangolare
% pdf1 = "trap" % pdf trapezoidale
% pdf1 = "asin" % pdf arcoseno
% pdf1 = "normf" % pdf a campana, con supporto finito (quasi-normale)
% pdf1 = "norm" % pdf normale
% pdf1 = "altro" % nessuna delle precedenti

%==============================
% Nota sulla risposta alle domande incorrelati, indipendenti
% incorrelati = 1 % sì, si possono considerare incorrelati
% incorrelati = 0 % no, non si possono considerare incorrelati
% Stessa cosa per "indipendenti = ?"

%==============================
% Suggerimento
% La pdf si può dedurre dal rapporto WCU/SU, o con la funzione "histogram"


% SOLUZIONE
% disp('==========Soluzione==========')
% clc
% U1 = max(abs(e1))
% sigma1 = sqrt(mean(e1.^2))
% pdf1 = "tri"
% 
% U2 = max(abs(e2))
% sigma2 = sqrt(mean(e2.^2))
% pdf2 = "tri"
% 
% sigma12 = mean(e1.*e2)
% rho12 = sigma12/(sigma1*sigma2)
% 
% incorrelati = 1 % perché rho12 = 0 (circa)
% 
% % Nota: l'indipendenza può essere dedotta dallo scatterplot:
% % plot(e1,e2,'.')
% 
% indipendenti = 0
% disp('=============================')

%% RISPOSTA QUESITO 11

% Y = 10
% N = 0
% X = 0

var1 = mean(e1.^2)

var2 = mean(e2.^2)

u1 = sqrt(var1)

u2 = sqrt(var2)

U1 = max(abs(e1)) % incertezza di caso peggiore, per l'errore e1
% Y

sigma1 = u1 % incertezza standard, per l'errore e1
% Y

pdf1 = 'tri'  % pdf dell'errore e1 (vedi nota)
% Y

U2 = max(abs(e2)) % incertezza di caso peggiore, per l'errore e2
% Y

sigma2 = u2 % incertezza standard, per l'errore e2
% Y

pdf2 = 'tri' % pdf dell'errore e2 (vedi nota)
% Y

sigma12 = mean(e1 * e2') % covarianza degli errori e1, e2
% Y

rho12 = sigma12 / (sigma1*sigma2)% coefficiente di correlazione degli errori e1, e2
% Y

incorrelati = 1 % gli errori si possono considerare incorrelati?
% Y

indipendenti = 0 % gli errori si possono considerare indipendenti?
% Y




%% TOTALE
% Y = 71/74, X = 0/74, N = 3/74, voto = 28.5666

%% CONDIZIONE BLOCCANTE
% condizione bloccante superata (risposta esatta alle prime 5 domande): sì

