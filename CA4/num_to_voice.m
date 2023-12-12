function [res] = num_to_voice(num, map)
    if (num < 20)
        res = map(num2str(num));
    end
    if (num >= 20)
        bagh = mod(num, 10);
        num = num - bagh;
        res = cat(1, map(num2str(num)), map('و'), map(num2str(bagh)));
    end
end