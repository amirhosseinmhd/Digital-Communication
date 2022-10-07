clear
clc;
z0 = 60;
 % FOR Y inductance
%y0 = 0.05;
%yl = 2*pi*0.01*i + 0.05;
 %f = 50*10^6;
zl = 240 ;
%u = 3*(10^8);
L = 3;
%beta = 2 * f * pi / u;
electrical_length = beta * L;
vs = 1;
z_s = 50;
%lambda = 2*pi/beta;

gamma_L = (zl - z0) /(zl + z0);
%gamma_L = (yl - y0) /(yl + y0);
"Absoule Value of Gamma Load " + abs(gamma_L)+newline+" Phase Gamma L "+rad2deg(phase(gamma_L))
gamma_0 = gamma_L.* exp(- j *2* electrical_length);
"Absoule Value of gamma_0 " + abs(gamma_0)+newline+" Phase  gamma_0 "+rad2deg(phase(gamma_0))
zin = z0 * (1 + gamma_0)/ (1 - gamma_0);
"Absoule Value of zin_0 " + abs(zin)+newline+ "Phase  zin_0 "+rad2deg(phase(zin))
v_0 = vs*zin/(z_s + zin);
"Absoule Value of v_0 " + abs(v_0)+newline+ "Phase  v_0 "+rad2deg(phase(v_0))
v_plus_0 = v_0/(1 + gamma_0)
"Absoule Value of v+(0) " + abs(v_plus_0)+newline+ "Phase  v+(0) "+rad2deg(phase(v_plus_0))
 
p = abs(v_plus_0)^2 *(1 - abs(gamma_L)^2)/(2 * z0)

v_load = v_plus_0*exp(- j * electrical_length)*(1+gamma_L)

 VSWR = (1 + abs(gamma_L))/(1 - abs(gamma_L));
%d_min = (pi - phase(gamma_L))/ (2 beta landa) %%% bahasb landa

 %agar khate ba talaf bod kari ke mikonim ine ke vplus mishe v_0 va v_l
% 
% vs = 34 ; zs = 100;
% v_0 = vs * zin/(zin + zs);
% vplus = v_0 /(1 + gamma_0)
% p = abs(vplus)^2 (1 - abs(thow_l)^2)/(2 z0)
