clc
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
