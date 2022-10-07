function [ent] = en(vec)
    ent = -sum(vec.*log2(vec));
end

