function [str] = decoding_amp(sig, bit_rate, Mapset)
    tot = 2 ^ bit_rate - 1;
    frac = zeros(1, tot + 1);  
    for i=1:tot + 1
        frac(i) = (i - 1) / tot;
    end
    err = 1/(tot * 2);
    res = '';
    t = 0:0.01:1 - 0.01;
    sin_sig = 2 * sin(2 * pi * t);
    for i=1:100:length(sig)
        corr_res = 0.01 * sum(sig(i:i + 99) .* sin_sig);
        koj = 1;
        for j=1:tot + 1
            if (abs(corr_res - frac(j)) < err)
                koj = j;
            end
        end
        bin_num = dec2bin(koj - 1, bit_rate);
        res = [res, bin_num];
    end
    str = bin_2_str(res, Mapset);
end

