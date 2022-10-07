function [cons, Es_avg] = constellation(M, modulation)

switch modulation
    case 'pam'
        cons = linspace(-M + 1 , M - 1 , M).';
        
    case 'psk'
        real_cons = cos((0:M-1)/M*2*pi).';
        imag_cons = cos((0:M-1)/M*2*pi).';
        cons = real_cons + 1i*imag_cons;
        
    case 'qam'
        disp("NOT YET")
    otherwise
        disp("There is no such a modulation in our func")
end
Es_avg = mean(abs(cons).^2); 
cons =  cons /sqrt(Es_avg) ;
Es_avg = mean(abs(cons).^2);
        
end


