function [res] = coding_amp(str, bit_rate, Mapset)
    code_str = str_to_bin(str, Mapset);
    code_len = length(code_str) / bit_rate;
    t = 0:0.01:code_len - 0.01;
    res = zeros(1, length(t));
    tot = 2 ^ bit_rate - 1;
    for i=1:code_len
        p = code_str((i - 1) * bit_rate + 1:(i - 1)*bit_rate + bit_rate);
        p = num2str(p);
        deci = bin2dec(p);
        frac = deci/tot;
        p = t((i - 1) * 100 + 1:(i - 1) * 100 + 100);
        res((i - 1) * 100 + 1:(i - 1) * 100 + 100) = frac * sin(2 * pi * p);
    end
    
    figure
    plot(t, res);
    
    
end