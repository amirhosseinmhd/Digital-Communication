clear;
clc;
T = 1;
fs = 10;
t1 = (-6*T:T/fs:6*T);
t2 = t1 - 0.1*T;
t3 = t2 - 0.2*T;
beta = ;
RC_1 = raised_cosine(t1, beta, T);
RC_2 = raised_cosine(t2, beta, T);
RC_3 = raised_cosine(t3, beta, T);
RC_1(isinf(RC_1)) = (pi/(T*4))*(sin((pi)/(2*beta)))./((pi)/2*beta);
RC_1(isnan(RC_1)) = 1;
RC_3(isinf(RC_3)) = (pi/(T*4))*(sin((pi)/(2*beta))./((pi)/2*beta));
RC_2(isnan(RC_2)) = 1;
RC_2(isinf(RC_2)) = (pi/(T*4))*(sin((pi)/(2*beta))./((pi)/2*beta));
RC_3(isnan(RC_3)) = 1;
subplot(3,1,1)
plot(t1, RC_1);
title("Raised Cosine for \beta = "+beta+" & Ideal Pulse")
grid on
subplot(3, 1, 2)
plot(t2, RC_1);
title("Raised Cosine for \beta = "+beta+" With 0.1 T Sampling Error")
grid on
subplot(3, 1, 3);
plot(t3, RC_1);
title("Raised Cosine for \beta = "+beta+" & With 0.2 T Sampling Error")
grid on
