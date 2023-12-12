function [blue_pic] = delete_unblue(picture)
    blue_pic = zeros([300, 500]);
    for i=1:300
        for j=1:500
            if ~(picture(i, j, 3) > 120 && picture(i, j, 1) + picture(i, j, 2) <= 130)
                blue_pic(i, j) = 0;
            else
                blue_pic(i, j) = 1;
            end
        end
    end
end
