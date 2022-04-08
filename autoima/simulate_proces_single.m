function xn = simulate_proces_single(x, u, Tp, R, L)
    xn = zeros(3, 1);
    yn = zeros(3, 1);
    xn(1, 1) = x(1) + Tp * 0.5 * R * (u(1) + u(2)) * cos(x(3));
    xn(2, 1) = x(2) + Tp * 0.5 * R * (u(1) + u(2)) * sin(x(3));
    xn(3, 1) = x(3) + (R / L) * Tp * (u(2) - u(1));
end