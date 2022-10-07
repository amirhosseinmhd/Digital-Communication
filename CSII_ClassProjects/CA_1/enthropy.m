function [ent, stationary] = enthropy(phai, k)
    %Phai is Transient Matrix
    size = length(phai);
    i_phai = transpose(phai) - eye(size);
    i_phai = [i_phai(1 : (size-1), : ) ; ones(1, size) ];
    B=zeros(size, 1);
    B=[B(1 : size -1); 1];
    %Stationary Matrix defines:
    stationary = linsolve(i_phai, B);
    %%%%%%%%%%%
    %Calculating Entrhopy 
    %Gk=(H(S1)+kH(s2|s1))/k
    %H(S1)= sigma pi log pi
    s1_enthropy = - sum( stationary .* log2(stationary) );
    %H(S2|S1) = H(x)=sigma(Hi * Pi)
    %Hi = sigma(-Pij logPij)
    tr_log_ent = transpose( log2(phai) );
    h_i = -(((phai * tr_log_ent).* eye(size))*ones(size,1));
    h_transient =  transpose(h_i) * stationary;
    %%%%%%Gk=(H(S1)+kH(s2|s1))/k
    ent = (s1_enthropy + k * h_transient)/k;
  
end
