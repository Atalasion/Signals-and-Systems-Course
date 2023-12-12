function [f] = isval(i, j)
    if i >= 1 && i <= 300 && j >= 1 && j <= 500
        f = 1;
    else
        f = 0;
    end
end