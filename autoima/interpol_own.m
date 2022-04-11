function [output] = interpol_own(f,multiply)
    output = zeros(3,length(f)*multiply);
    output(1,1:1*multiply) = linspace(f(1,1),f(1,2),multiply);
    output(2,1:1*multiply) = linspace(f(2,1),f(2,2),multiply);
    output(3,1:1*multiply) = linspace(f(3,1),f(3,2),multiply);
   
    for i = 1:length(f)-1
            output(1,i*multiply+1:(i+1)*multiply) = linspace(f(1,i),f(1,i+1),multiply);
            output(2,i*multiply+1:(i+1)*multiply) = linspace(f(2,i),f(2,i+1),multiply);
            output(3,i*multiply+1:(i+1)*multiply) = linspace(f(3,i),f(3,i+1),multiply);
    end

end