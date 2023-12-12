function [res] = bin_2_str(str, Mapset)
    res = '';
    for i=1:5:strlength(str)
        tmp = '';
        for j = i:i + 4
            tmp = [tmp, str(j)];
        end
        for j = 1:32
            if (Mapset{2, j} == tmp)
                res = [res, Mapset{1, j}];
            end
        end
    end
end