%Finding eta

SNR_dB = 0:1:10;
SNR_R = 10.^(SNR_dB/10);
eta = 1./SNR_R;
eta_p = sqrt(eta/2);
noise = randn(size(transmitted_signal));
[~, rows] = size(transmitted_signal);
recived_signal = zeros(11, rows);
recived_signal_2 = zeros(11, rows);
recived_signal_3 = zeros(11, rows);

for i = 1:11
    recived_signal(i, :) = noise.* eta_p(i) + transmitted_signal;
    recived_signal_2(i, :) = noise.* eta_p(i) + transmitted_signal_2;
    recived_signal_3(i, :) = noise.* eta_p(i) + transmitted_signal_3;
end


