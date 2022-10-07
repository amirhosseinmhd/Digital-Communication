prob = [0.7 0.29 0.01];
k = 3;
G_k = ones(1, k);
for i = 1:k
    G_k(i) = enthropy(prob, i);
end
% efficency H(x)/H_hat(x) 
% H(x) is G_k if k tends to infinty
% H_hat(x) is sigma(ni pi)/2 = avg_len/k
H_x = enthropy(prob,1000000);
source_symbols = randsrc(1,1000000,[0.7 0.29 0.01]);
p = {'0.7', '0.29', '0.01'};
symbols = {'A', 'B', 'C'};
dict = cell(1,k);
H_hat_x = ones(1,k);
avg_len = ones(1,k);
efficency = ones(1,k);

for i = 1:k
     [temp, avg_len(i)] = memoryless(symbols, p, i);
     dict(i) = {temp};
     H_hat_x(i) = avg_len(i)./i;
     efficency(i) = H_x./H_hat_x(i);
end

%Encoded Signal:
%comp = huffmanenco(source_symbols,dic{7});


i=[1:k]
subplot(2,2,[1,2])
plot(i,avg_len)
title('Average Length & G_k');
xlabel('k')
hold on
plot(i,G_k)
grid on
legend('Average Length','G_k')

subplot(2,2,[3,4])
plot(i,efficency)
hold on
plot(i,G_k);
title('Efficinecy & G_kd')
legend('Efficienty','G_k')
xlabel('k')
grid on
