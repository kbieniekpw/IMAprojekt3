function u = generate_u()
    u = zeros(2, 2000);
    for k=11:2000
       if k < 10
          u(:, k) = 0; 
       end
       if k > 10
          u(:, k) = 2; 
       end
       if k > 250
          u(1, k) = 1;
          u(2, k) = 2.5;
       end
       if k > 350
          u(1, k) = 2;
          u(2, k) = 2;
       end
       if k > 450
          u(1, k) = 2;
          u(2, k) = 0.5;
       end
    end
    
end