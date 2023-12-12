function p4_4(filename, speed)
    filename
    [x, fs] = audioread(filename);
    speed = speed * 10;
    if speed == 10
        sound(x, fs)
        return;
    end
    if speed < 10
        cnt = floor(10 / speed);
        remi = rem(10, cnt * speed);
        y = zeros(1, round(10/speed * length(x)) + 100);
        pnt = 1;
        for i=1:speed:length(x)
            sum = 0;
            ted = 0;
            for j=i:i + speed - 1
                if j > length(x)
                    continue
                end
                sum = sum + x(j);
                ted = ted + 1;
                for k=1:cnt
                    y(pnt) = x(j);
                    pnt = pnt + 1;
                end
            end
            for j=1:remi
                y(pnt) = sum/ted;
                pnt = pnt + 1;
            end
        end
        sound(y, fs);
    end
    if speed > 10
        hazf = speed - 10;
        y = zeros(1, round(10 / speed * length(x)) + 100);
        cnt = floor(speed/10);
        remi = rem(speed, 10);
        pnt = 1;
        remi
        for i=1:speed:length(x)
            koj = i;
            for j=1:remi
                sum = 0;
                for k=1:cnt + 1
                   sum = sum + x(koj);
                   koj = koj + 1;
                end
                y(pnt) = sum / (cnt + 1);
                pnt = pnt + 1;
            end
            for j=1:10-remi
                sum = 0;
                for k=1:cnt
                    sum = sum + x(koj);
                    koj = koj + 1;
                end
                y(pnt) = sum / cnt;
                pnt = pnt + 1;
            end
        end
        sound(y, fs);
    end
end