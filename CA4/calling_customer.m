function [] = calling_customer(num, bud)
    if (num < 1 || num > 99 || bud < 1 || bud > 9)
        fprintf("Invalid\n");
        return
    end
    map = containers.Map();
    [shomareye, fs] = audioread('shomareye.m4a');
    [bebajeye, fs] = audioread('bebajeye.m4a');
    [O, fs] = audioread('O.m4a');
    map('شماره ی') = shomareye;
    map('به باجه ی') = bebajeye;
    map('و') = O;
    
    for i=1:19
        res = 'Recording (';
        res = [res, num2str(i), ')','.m4a'];
        [no, fs] = audioread(res);
        map(num2str(i)) = no;
    end
    for i=20:10:90
        res = 'Recording (';
        res = [res, num2str(i), ')','.m4a'];
        [no, fs] = audioread(res);
        map(num2str(i)) = no;
    end
    save('mapset.mat', 'map');
    res = cat(1, map('شماره ی'), num_to_voice(num, map), map('به باجه ی'), num_to_voice(bud, map));
    sound(res, fs);
end