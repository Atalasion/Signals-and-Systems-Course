clc
close all;
clear;
% SELECTING THE TEST DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
figure
subplot(2,2,1)
imshow(picture)
picture=imresize(picture,[300 500]);
subplot(2,2,2)
imshow(picture)

picture = mygrayfun(picture);
subplot(2, 2, 3)
imshow(picture)

picture = mybinaryfun(picture, 0.455);
picture = logical(picture);
subplot(2, 2, 4)
imshow(picture)
picture = ~picture;

figure
subplot(1, 3, 1)
imshow(picture)

picture = myremovecom(picture, 300);
background = myremovecom(picture, 2500);
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


load TRAININGSET;
totalLetters=size(TRAIN,2);


final_output=[];
t=[];
figure
for n=1:Ne
    [r,c]=find(L==n);
    Y=picture(min(r):max(r),min(c):max(c));
    imshow(Y)
    Y=imresize(Y,[42,24]);
    imshow(Y)
    pause(0.2)
    
   
    ro=zeros(1,totalLetters);
    for k=1:totalLetters   
        ro(k)=corr2(TRAIN{1,k},Y);
    end

    [MAXRO,pos]=max(ro);
    if MAXRO>.45
        out=cell2mat(TRAIN(2,pos));       
        final_output=[final_output out];
    end
end
fprintf("%s\n", final_output);
file = fopen('eng_res.txt', 'wt');
fprintf(file, "%s\n", final_output);
fclose(file);
winopen('eng_res.txt')

