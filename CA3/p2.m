clc
close all;
clear;
fr = [697 770 852 941];
fc = [1209 1336 1477];
fs = 8000;
Ts = 1/fs;
Ton = 0.1;
Toff = 0.1;
number = '43218765';
[aa, number_len] = size(number);
t = 0:Ts:Ton - Ts;
r = [4 1 1 1 2 2 2 3 3 3];
c = [2 1 2 3 1 2 3 1 2 3];
t_len = length(t);
res = zeros(1, t_len * (number_len * 2));
for i=1:number_len
    l = (i - 1) * t_len * 2;
    l = l + 1;
    rr = l + t_len - 1;
    n = double(number(i)) - double('0');
    y1 = sin(2 * pi * fr(r(n + 1)) * t);
    y2 = sin(2 * pi * fc(c(n + 1)) * t);
    y = (y1 + y2) / 2;
    res(l:rr) = y;
end
sound(res, fs);
audiowrite('y.wav', res, fs);

[a, fs] = audioread('a.wav');
a = a';
a_len = length(a);
res = '';
for i=1:t_len * 2:a_len
    x = a(i:i + t_len - 1);
    mx = zeros(1, 10);
    for j=0:9
        rr = r(j + 1);
        cc = c(j + 1);
        y1 = sin(2 * pi * fr(rr) * t);
        y2 = sin(2 * pi * fc(cc) * t);
        y = (y1 + y2) / 2;
        mx(j + 1) = corr2(x', y');
    end
    [b, koj] = max(mx);
    res = [res, char(double('0') + koj - 1)];
end
fprintf("the phonenumber is: %s\n", res);

