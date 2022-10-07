transient_matrix = [0.5 0.5; 0.8 0.2];
chain_len = 1000000;
k=10;
G_k = ones(1, k);
for i = 1:k
    G_k(i) = enthropy(transient_matrix, i);
end
% efficency H(x)/H_hat(x) 
% H(x) is G_k if k tends to infinty
% H_hat(x) is sigma(ni pi)/2 = avg_len/k
H_x = enthropy(transient_matrix,1000000);
symbols = markov_chain(transient_matrix, chain_len);
H_hat_x = ones(1,k);
avg_len = ones(1,k);
efficency = ones(1,k);

for i = 1:k
     avg_len(i) = average_lentgh(symbols, i);
     H_hat_x(i) = avg_len(i)./(i);
     efficency(i) = H_x./H_hat_x(i);
end
i=[1:k];
figure

subplot(2,2,[1,2])
plot(i,avg_len)
xlim([0 11])
ylim([0 13])
title('Average Length & G_k');
xlabel('k')
hold on
plot(i,G_k)
legend('Average Length','G_k')
grid on

subplot(2,2,[3,4])
plot(i,efficency)
hold on;
plot(i,G_k);
title('Efficinecy is blue, G_k is Red');
xlabel('k');
legend('Efficienty','G_k')
grid on;
