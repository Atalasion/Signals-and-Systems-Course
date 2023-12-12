function p4_3(filename, speed)
    filename
    [x, fs] = audioread(filename);
    if speed ~= 0.5 && speed ~= 2
        fprintf("Sorry. It's not possible");
        return;
    end
    if speed == 2
        ylen = round(length(x) / 2);
        y = zeros(1, ylen);
        for i=1:ylen
            y(i) = x(2 * i - 1);
        end
        sound(y, fs);
    end
    if speed == 0.5
        ylen = length(x) * 2;
        y = zeros(1, ylen);
        for i=1:length(x)
            y(2 * i - 1) = x(i);
        end
        for i=2:2:ylen - 2
            y(i) = (y(i - 1) + y(i + 1)) / 2; 
        end
        sound(y, fs)
    end
end