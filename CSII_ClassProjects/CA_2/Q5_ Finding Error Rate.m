error = zeros (11, row);
error_2 = zeros (11, row);
error_3 = zeros (11, row);

%power_error = zeros (11, row);
num_error = zeros (11, 1);
num_error_2 = zeros (11, 1);
num_error_3 = zeros (11, 1);


for i = 1:11
    error(i, :) = modulated_symbols - detected_symbol(i,:);
    num_error(i) = nnz(error(i, :));
    error_2(i, :) = modulated_symbols - detected_symbol_2(i,:);
    num_error_2(i) = nnz(error_2(i, :));
    error_3(i, :) = modulated_symbols - detected_symbol_3(i,:);
    num_error_3(i) = nnz(error_3(i, :));
end
semilogy(SNR_dB, num_error/N , '-o', SNR_dB, num_error_2/N, '-+', SNR_dB, num_error_3/N, '-*')  
grid on
title("The BER Performance of Binary PAM for \beta = "+beta)
legend('Ideal Sampling', 'Sampling Error = 0.1T', 'Sampling Error = 0.2T'); 
xlabel('E_b/\eta in dB')
ylabel('Bit Error Rate')

