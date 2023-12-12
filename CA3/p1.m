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
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
picture = rgb2gray(picture);
figure
subplot(1, 2, 1);
imshow(picture)
code_pic = coding('signal;', picture, Mapset);
hold on
subplot(1, 2, 2);
imshow(code_pic)
code = decoding(code_pic, Mapset);
