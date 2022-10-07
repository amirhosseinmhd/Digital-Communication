T = [-20.1 : 1: -1]
R = [1.1 : 1 : 21.1]
T = [T, R]
r = sqrt(3/2).*(sin(pi * T)./(pi.*T)).^2
plot(T,r)
sum(r)