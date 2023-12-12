function [decode_str] = str_to_bin(str, Mapset)
    len_str = strlength(str);
    decode_str = zeros(1, 5 * len_str);
    for i=1:len_str
        koj = 0;
        for j=1:32
            if (Mapset{1, j} == str(i))
                koj = j;
                break;
            end
        end
        code_bin = Mapset{2, koj};
        for j=1:5
            st = (i - 1) * 5;
            if (code_bin(j) == '1')
                decode_str(st + j) = 1;
            end
            if (code_bin(j) == '0')
                decode_str(st + j) = 0;
            end
        end
    end
end