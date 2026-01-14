SIZE = 50;
dt = 1e-3;
t = (linspace(0, SIZE, SIZE) * dt)';

theta = [2; 4]; % q m

subplot(2,1,1);
hold on;
x = theta(1) * ones(SIZE, 1) + theta(2) .* t;
y = x + randn(SIZE, 1) * 0.1;
plot(t, x)
plot(t, y)
xlabel('time [s]')
ylabel('voltage [V]')

A = [ones(SIZE, 1), t];
Q = (A'*A)^-1;
C = Q*A';
P = A*C;

theta_hat = C * y;
x_hat = P * y;
plot(t, x_hat)

subplot(2,1,2);
hold on;
xlabel('time [s]')
ylabel('error [V]')
e = y - x;
e_hat = y - x_hat;
plot(t, e)
plot(t, e_hat)
legend('real error', 'residual')

% type A valutation (tStudent)
ni = SIZE - size(theta, 1);
SSR = sum(e_hat.^2);
u0 = sqrt(SSR/ni);
Sigma = u0^2 * eye(SIZE);

subplot(2,1,1)
% Sigma_x = u0^2 * P;
Sigma_x = P*Sigma*P';
ux = sqrt(diag(Sigma_x));
k_95 = tinv((1+0.95)/2, ni);
U_x = ux * k_95;
xL = x_hat - U_x;
xU = x_hat + U_x;
plot(t, xL, 'w--')
plot(t, xU, 'w--')
legend('real signal', 'misured signal', 'estimated signal', 'upper limit', 'lower limit')


% Sigma_theta = u0^2 * Q;
Sigma_theta = C*Sigma*C';
u_theta = sqrt(diag(Sigma_theta));
U_theta = u_theta * k_95;
theta_min = theta_hat - U_theta;
theta_max = theta_hat + U_theta;

