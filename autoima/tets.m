clear all;

kk = 900;
R = 0.05;
L = 0.35;
Tp = 0.01;

Pm = 1 * diag([1 1 1]);
Qm = 1 * diag([1 1 1]);
Rm = 10 * diag([1 1 1]);

N = 30;
Nu = 5;
ny = 3;
nx = 3;
nu = 2;
lambda = diag(repmat([0.1 0.1], 1, Nu));
psi = diag(repmat([2 2 1], 1, N));

u = zeros(2, kk);
x = zeros(3, kk);
y = zeros(3, kk);
x_est = zeros(3, kk);
x_lin = zeros(3, kk);
y_zad = get_trajectory();



for k=11:kk
    %% Symulacja procesu
    xk = simulate_proces(x, u, k, Tp, R, L);
    x(:, k) = xk;
    y(:, k) = xk;

    %% Kalman
    [A B C] = linearize_kalman(x_est(:,k-1), u(:,k-1),R,L,Tp);
    x_est_prev = simulate_proces(x_est, u, k, Tp, R, L);
    P_prev = A * Pm * A'  + Qm;
    y_est = y(:, k) - C * x_est_prev;
    S = C * P_prev * C' + Rm;
    K = P_prev * C' * inv(S);
    x_est(:, k) = x_est_prev + K * y_est;
    Pm = (diag([1 1 1]) * K * C) * P_prev;

    %% Linearyzacja dla regulatora
    [A B C] = linearize_kalman(x_est(:,k), u(:,k-1),R,L,Tp);

    %% Regulator
    y_zad_v = get_yzad(k, y_zad, N, nx);
    y_0_v = get_y0_v(N, ny, x_est, u, Tp, R, L, k);
    M = get_M_matrix(A, B, nx, nu, Nu, N);
    C_dash = diag(ones(1, N*nx));
    K_r = inv(M'*C_dash'*psi*C_dash*M+lambda)*M'*C_dash'*psi;
    K_r = K_r(1:nu, :);
    dU_v = K_r * (y_zad_v - y_0_v);
    u(:, k) = u(:, k-1) + dU_v;
    
end
figure
plot(x(1, :), x(2, :), 'LineWidth', 1.5);
hold on;
plot(x_est(1, :), x_est(2, :), '--','LineWidth', 1.5);
plot(y_zad(1, :), y_zad(2, :), '--', 'LineWidth', 1.5);
grid on;

figure;
plot(u(1, :))
hold on;
plot(u(2, :), '--')