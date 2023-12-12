function [pic] = coding(code, graypic, Mapset)
    [n, m] = size(graypic);
    pnt=0;
    pic = zeros(n, m);
    [aa, code_len] = size(code);
    pic = graypic;
    if (n * m < code_len * 5)
        fprintf("The size doesn't fit\n");
        return
    end
    for i=1:code_len
        koj = 0;
        for j=1:32
            if (Mapset{1, j} == code(i))
                koj = j;
                break;
            end
        end
        code_bin = Mapset{2, koj};
        l = (i - 1) * 5;
        for j=1:5
            r = floor(l / m) + 1;
            c = mod(l, m) + 1;
            if (code_bin(j) == '1')
                pic(r, c) = bitor(1, pic(r, c));
            end
            if (code_bin(j) == '0')
                pic(r, c) = bitand(254, pic(r, c));
            end
            l = l + 1;
        end
    end
end