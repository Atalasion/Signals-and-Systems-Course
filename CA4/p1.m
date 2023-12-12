clc
close all;
clear;
Mapset = cell(2, 32);
for i=0:25
    Mapset{1, i + 1} = char(i + double('a'));
    Mapset{2, i + 1} = char(dec2bin(i, 5));
end
for i=27:32
    Mapset{2, i} = char(dec2bin(i - 1, 5));
end
Mapset{1, 27} = ' ';
Mapset{1, 28} = '.';
Mapset{1, 29} = ',';
Mapset{1, 30} = '!';
Mapset{1, 31} = '"';
Mapset{1, 32} = ';';
res1 = coding_amp('signal', 1, Mapset);
res2 = coding_amp('signal', 2, Mapset);
res3 = coding_amp('signal', 3, Mapset);
deres1 = decoding_amp(res1, 1, Mapset);
deres2 = decoding_amp(res2, 2, Mapset);
deres3 = decoding_amp(res3, 3, Mapset);
y = randn(1, 1000000);
fprintf("%f\n", mean(y));
fprintf("%f\n", std(y));
%histogram(y, 'Normalization', 'probability');

for s=0.01:0.1:2.01
    s
    y1 = s * randn(1, length(res1));
    decoding_amp(res1 + y1, 1, Mapset)
    
    y2 = s * randn(1, length(res2));
    decoding_amp(res2 + y2, 2, Mapset)

    y3 = s * randn(1, length(res3));
    decoding_amp(res3 + y3, 3, Mapset)
end