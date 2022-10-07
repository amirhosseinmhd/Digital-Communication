function [RC] = raised_cosine(t, beta, T)
        RC = (sin((pi*t)/T)./((pi*t)/T)).* (cos(pi*beta*t/T)) ./ (1 - (2*beta*t/T).^2);
  
end

