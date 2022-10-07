function [symbol,chain] = markov_chain(transition_states, chain_len)

    symbol=zeros(1,chain_len);
    len = length(transition_states);
    i_phai = transpose(transition_states) - eye(len);
    i_phai = [i_phai(1 : (len-1), : ) ; ones(1, len) ];
    B=zeros(len, 1);
    B=[B(1 : len -1); 1];
    %Stationary Matrix defines:
    stationary = linsolve(i_phai, B);
    chain = zeros(1,chain_len);
    [number_of_states,~] = size(transition_states);
    %initial  state markov chain
    chain(1) = randsrc(1,1,[1 2;0.1 0.9]);
    for i = 2:chain_len+1
        %creating random symbol_state with randsrc with repect to previous
        %chain
        chain(i) = randsrc(1,1,[1:number_of_states;transition_states(chain(i-1),:)]);
        %symbols created for 2D vector
        if i==0
            continue
        else
        transient=[chain(i-1),chain(i)];
        tr=num2str(transient);
            switch tr
                case '1  1'
                    symbol(i-1)=2;
                case '1  2'
                    symbol(i-1)=1;
                case '2  1'
                    symbol(i-1)=1;
                case '2  2'
                    symbol(i-1)=2;
            end
        end
    end