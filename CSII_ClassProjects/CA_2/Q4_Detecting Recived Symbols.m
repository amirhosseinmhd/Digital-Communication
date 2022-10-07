[~,N] = size(modulated_symbols);
T_sampling = 6*L+1:L:(N+6-1)*L+1;
[~, row] = size(T_sampling);
samples = zeros(11, row);
detected_symbol = zeros(11, row);
detected_symbol_2 = zeros(11, row);
detected_symbol_3 = zeros(11, row);

for i = 1:11
   samples(i, :) = recived_signal(i, T_sampling); 
   detected_symbol(i, :) = sign(samples(i, :));
   samples(i, :) = recived_signal_2(i, T_sampling); 
   detected_symbol_2(i, :) = sign(samples(i, :));
   samples(i, :) = recived_signal_3(i, T_sampling); 
   detected_symbol_3(i, :) = sign(samples(i, :));
end
