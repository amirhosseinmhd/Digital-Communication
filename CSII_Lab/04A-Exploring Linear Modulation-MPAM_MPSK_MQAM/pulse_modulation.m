function [tx_smpl, cons] = pulse_modulation(sym_idx, modulation, M, fs, smpl_per_symbl, pulse_name , pulse_shape_mode, varargin)
[cons, ~] = constellation(M, modulation);
mod_sym = cons(sym_idx+1);

pulse = pulse_shape(pulse_name, fs, smpl_per_symbl);
if pulse_shape_mode == "kron"
    tx_smpl = kron(mod_sym, pulse);
elseif pulse_shape_mode == "conv"
    s_zero_pad = upsample(mod_sym, smpl_per_symbl);
    s_zero_pad = s_zero_pad(1:end-smpl_per_symbl+1);
    tx_smpl = conv(s_zero_pad, pulse);
end
