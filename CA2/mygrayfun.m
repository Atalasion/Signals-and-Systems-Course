function [gray_pic] = mygrayfun(picture)
    gray_pic = 0.299 * picture(:,:,1) + 0.578 * picture(:,:,2) + 0.114 * picture(:,:,3);
end