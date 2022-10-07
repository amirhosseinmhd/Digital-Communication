
function [dict,avglen] = memoryless(symbols, p,k)
    %symbols should be in format of {'a','b'...}
    %probabilities should be in format of {'0.7','0.2'...}
    c = dec_multipliction({symbols},k);
    %here we have decartian multipliction of c1, k times to itself
    [rows, ~] = size(c);
    word = cell(1, rows);
    for i = 1:rows
        word(1,i) = {strjoin(c(i,:),'')};
    end
    str_p = dec_multipliction({p},k);
    [rows_2, ~] = size(str_p);
    p_num = cellfun (@str2num, str_p);
    p = ones (1,rows_2);
    for i = 1:rows_2
        for j = 1:k
        p (1,i) = p_num(i,j).*p(1,i);
        end
    end
    [dict,avglen] = huffmandict(word,p);
end

