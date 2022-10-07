function b_gray = gray_code (k)
if k == 1
    b_gray = [0; 1];
else
    temp = gray_code (k-1);
    b_gray = [zeros(2^(k-1), 1); ones(2^(k-1), 1)];
    b_gray = [b_gray, [temp; flip(temp,1)]];
end