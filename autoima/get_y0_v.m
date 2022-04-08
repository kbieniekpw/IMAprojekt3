function y0_v = get_y0_v(N, ny, x, u, Tp, R, L, k)
    y0_v = zeros(N*ny, 1);
    for i=1:N
        if i == 1
            y0_v(1:ny) = simulate_proces_single(x(:, k), u(:, k-1), Tp, R, L);
        else
            y0_v(((i-1)*ny+1):(ny*i), 1) = simulate_proces_single(y0_v(((i-1-1)*ny+1):(ny*(i-1)), 1), u(:, k-1), Tp, R, L);
        end
    end
end