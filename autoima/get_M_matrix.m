function M = get_M_matrix(A, B, nx, nu, Nu, N)
    M = [];
    base_col = [];
    for r=1:N
        if r == 1
            base_col = [base_col ; B];
        else
            a_term = zeros(nx, nx);
            for i=1:(r-1)
                a_term = a_term + A^(i) + diag([1 1 1]);
            end
            base_col = [base_col ; a_term * B];
        end
    end
    for c=1:Nu
       if c == 1
            M = [M  base_col];
       else
            curr_col = [repmat(zeros(nx, nu), c-1, 1)  ; base_col(1:nx*(N-c+1), :)];
            M = [M  curr_col];
       end
    end
end