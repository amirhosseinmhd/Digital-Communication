
function avg_len = average_lentgh(chain , k)
len = length(chain);
new_Chain = reshape(chain , [len, 1]);
modol = mod(len,k);
new_Chain = new_Chain(1:len-modol);
new_Chain = reshape(new_Chain,[k floor(len/k)]);
t = 0;
for i = 1:k
    t = new_Chain(i,:).*power(10,k-i) + t;
end
%finding unique symbols in chain
symbols = unique(t);
for i = 1:length(symbols)
    p(1,i) = sum(t == symbols(1,i))/length(t);
end
[dict,avg_len] = huffmandict(symbols,p);

end

