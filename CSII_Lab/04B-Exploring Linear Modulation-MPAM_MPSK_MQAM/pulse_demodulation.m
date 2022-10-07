function [det_sym_idx, rx_sym] = pulse_demodulation(rx_smpl, modulation, M, fs, smpl_per_symbl, pulse_name , rx_mode, varargin)
pulse = pulse_shape(pulse_name, fs, smpl_per_symbl);
[rx_sym] = corr_match(rx_smpl, pulse, smpl_per_symbl, rx_mode);
[cons, ~] = constellation(M, modulation);
det_sym_idx = min_dist_detector(rx_sym, cons);

