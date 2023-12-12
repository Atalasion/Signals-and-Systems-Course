clc
close all;
clear;
% SELECTING THE TEST DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
figure
subplot(1, 3, 1);
picture=imresize(picture,[300 500]);
imshow(picture)
%figure
pic_blue = delete_unblue(picture);
%imshow(pic_blue)
pic_blue = bwareaopen(pic_blue, 100);
background = bwareaopen(pic_blue, 1000);
pic_blue = pic_blue - background;
subplot(1, 3, 2);
imshow(pic_blue)
[L, Ne] = bwlabel(pic_blue);
[r, c] = find(L == 1);
r1 = min(r);
r2 = max(r);
c1 = min(c);
c2 = max(c);
delta_x = 20;
delta_y = 200;
r1 = r1 - delta_x;
r2 = r2 + delta_x;
c1 = c1 - 20;
c2 = c2 + delta_y;
picture2 = picture(r1:r2, c1:c2, :);
subplot(1, 3, 3)
imshow(picture2)
picture = picture2;
picture=imresize(picture,[300 500]);

picture = mygrayfun(picture);
picture = mybinaryfun(picture, 0.455);
picture = logical(picture);
picture = ~picture;
figure
subplot(1, 3, 1)
imshow(picture)

picture = myremovecom(picture, 500);
background = myremovecom(picture,4000);
picture = picture - background;
subplot(1, 3, 2)
imshow(picture)

[L, Ne] = mysegmentation(picture);
[Lm,Nem]=bwlabel(picture);
subplot(1, 3, 3)
imshow(picture)
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
    propied(n).BoundingBox;
end
hold off


load PER_TRAININGSET;
totalLetters=size(PER_TRAIN,2);


figure
final_output=[];
t=[];
for n=1:Ne
    [r,c]=find(L==n);
    Y=picture(min(r):max(r),min(c):max(c));
    imshow(Y)
    pause(0.2)
    
   
    ro=zeros(1,totalLetters);
    for k=1:totalLetters
        [numRow, numCol] = size(PER_TRAIN{1, k});
        Y = imresize(Y, [numRow, numCol]);
        ro(k)=corr2(PER_TRAIN{1,k},Y);
    end

    [MAXRO,pos]=max(ro);
    if MAXRO>.45
        out=cell2mat(PER_TRAIN(2,pos));       
        final_output=[final_output out];
    end
end
fprintf("%s\n", final_output);
file = fopen('per_res.txt', 'wt');
fprintf(file, "%s\n", final_output);
fclose(file);
winopen('per_res.txt')


