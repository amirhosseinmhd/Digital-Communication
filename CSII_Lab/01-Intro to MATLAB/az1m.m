n = 500;
temp = 1./([1:n] + [1:n]' -1);
A = eig(temp);
A= sort(A);
disp(A(end))