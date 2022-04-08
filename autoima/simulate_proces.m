function xn = simulate_proces(x, u, k, Tp, R, L)
    xn = zeros(3, 1);
    yn = zeros(3, 1);
    xn(1, 1) = x(1, k-1) + Tp * 0.5 * R * (u(1, k-1) + u(2, k-1)) * cos(x(3, k-1));
    xn(2, 1) = x(2, k-1) + Tp * 0.5 * R * (u(1, k-1) + u(2, k-1)) * sin(x(3, k-1));
    xn(3, 1) = x(3, k-1) + (R / L) * Tp * (u(2, k-1) - u(1, k-1));
end