function [binary_pic] = mybinaryfun(picture, threshold)
    binary_pic = im2double(picture) > threshold;
end
    