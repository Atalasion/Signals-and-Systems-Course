function [] = ICrecognition(picture, IC)
    old_pic = picture;
    picture = rgb2gray(picture);
    old_picg = picture;
    picture = double(picture);
    mean_val = mean(picture(:));
    std_val = std(picture(:));
    picture = (picture - mean_val) / std_val;
    imshow(picture);
    picture = old_picg;
    IC = rgb2gray(IC);
    hold on
    figure
    imshow(IC);
    IC = double(IC);
    mean_val = mean(IC(:));
    std_val = std(IC(:));
    IC = (IC - mean_val) / std_val;
    imshow(IC);
    [IC_n, IC_m] = size(IC);
    [pic_n, pic_m] = size(picture);
    mx = zeros(pic_n, pic_m);
    threshold = 0.5;
    IC_rot = imrotate(IC, 180);
    figure
    imshow(old_pic);
    hold on;
    for i=1:pic_n - IC_n + 1
        for j = 1:pic_m - IC_m + 1
            y = picture(i:i + IC_n - 1, j:j + IC_m - 1);
            if (mycorrcoef(IC, y) > threshold || mycorrcoef(IC_rot, y) > threshold)
                rectangle('Position', [j, i, IC_m, IC_n], 'EdgeColor', 'b', 'LineWidth', 2);
            end
        end
    end
    hold on;
end