function [A, B, C] = linearize_kalman(x, u, R, L, Tp)
    A = zeros(2, 3);
    B = zeros(2, 2);
    C = diag([1 1 1]);
    
    A(1, 1) = 1;
    A(1, 3) = -0.5 * R * Tp * (u(1) + u(2)) * sin(x(3));
    A(2, 2) = 1;
    A(2, 3) = 0.5 * R * Tp * (u(1) + u(2)) * cos(x(3));
    A(3, 3) = 1;
    
    B(1, 1) = 0.5 * Tp * R * cos(x(3));
    B(1, 2) = 0.5 * Tp * R * cos(x(3));
    B(2, 1) = 0.5 * Tp * R * sin(x(3));
    B(2, 2) = 0.5 * Tp * R * sin(x(3));
    B(3, 1) = -R / L * Tp;
    B(3, 2) = R / L * Tp;
end