T = 1;
fs = 10;
L = T * fs;
bits = randi([0,1],1,1000000);
modulated_symbols(logical(bits)) = 1;
modulated_symbols(~logical(bits)) = -1;
temp0 = upsample(modulated_symbols,L);

temp0 = temp0(1:end-(L-1));

transmitted_signal = conv(temp0,RC_1);
transmitted_signal_2 = conv(temp0,RC_2);
transmitted_signal_3 = conv(temp0,RC_3);
