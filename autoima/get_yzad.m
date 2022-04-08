function y_zad_v = get_yzad(k, yzad, N, nx)
    y_zad_v = zeros(N * nx, 1);
    for i=1:N
        y_zad_v(((i-1)*nx+1):(nx*i), 1) = yzad(:, k+i);
    end
end