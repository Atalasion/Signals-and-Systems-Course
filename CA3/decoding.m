function [res] = coding(code_pic, Mapset)
    [n, m] = size(code_pic);
    res = '';
    for i=0:5:n * m - 1
        a = '';
        for j=0:4
            r = floor((i + j) / m) + 1;
            c = mod((i + j), m) + 1;
            if (mod(code_pic(r,c), 2) == 1)
                a = [a, '1'];
            end
            if (mod(code_pic(r, c), 2) == 0)
                a = [a, '0'];
            end
        end
        for j=1:32
            if (Mapset{2, j} == a)
                res = [res, Mapset{1, j}];
                break;
            end
        end
        if (a == '11111')
            break;
        end
    end
    fprintf("code: %s\n", res);
end