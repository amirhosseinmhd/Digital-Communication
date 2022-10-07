N = 1000000;
T_sampling = 6*L+1 : L : (N+6-1)*L+1;
samples0 = received_signal(:,T_sampling);
detected_symbols_MAP = zeros(11,N);
for i = 1:11
    detected_symbols_MAP(i,(samples0(i,:)<=(-2-eta(1,i).*log(2)))) = -3;
    detected_symbols_MAP(i,(samples0(i,:)>(-2-eta(1,i).*log(2)) & samples0(i,:)<=0)) = -1;
    detected_symbols_MAP(i,(samples0(i,:)>0 & samples0(i,:)<=(2-eta(1,i).*log(2)))) = 1;
    detected_symbols_MAP(i,(samples0(i,:)>(2-eta(1,i).*log(2)))) = 3;
end
detected_symbols_ML = zeros(11,N);
detected_symbols_ML(samples0<=-2) = -3;
detected_symbols_ML(samples0>-2 & samples0<=0) = -1;
detected_symbols_ML(samples0>0 & samples0<=2) = 1;
detected_symbols_ML(samples0>2) = 3;

error = zeros (11, N);
error_2 = zeros (11, N);
error_3 = zeros (11, N);

%power_error = zeros (11, row);
num_error_ML = zeros (11, 1);
num_error_MAP = zeros (11, 1);
num_error_3 = zeros (11, 1);

for i = 1:11
    error(i, :) = modulated_symbol - detected_symbols_ML(i,:);
    num_error_ML(i) = nnz(error(i, :));
    error_2(i, :) = modulated_symbol - detected_symbols_MAP(i,:);
    num_error_MAP(i) = nnz(error_2(i, :));
end
figure
semilogy(SNR_dB, num_error_ML/N , '-o', SNR_dB, num_error_MAP/N, '-+'); 
grid on
title("The BER Performance of 4PAM for \beta = "+beta)
legend('MAP Estimation', 'ML Estimation'); 
xlabel('SNR in dB')
ylabel('Bit Error Rate')


