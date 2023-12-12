function [res] = mycorrcoef(x, y) 
    y = double(y);
    mean_val = mean(y(:));
    std_val = std(y(:));
    y = (y - mean_val) / std_val;
    summ = x .* y;
    sumx = x .* x;
    sumy = y .* y;
    summ = sum(summ(:));
    sumx = sum(sumx(:));
    sumy = sum(sumy(:));
    res = summ / sqrt(sumx * sumy);
end