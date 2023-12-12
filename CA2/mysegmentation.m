function [L, Ne] = mysegmentation(picture)
    size = 8;
    dis = zeros([300, 500]);
    INF = 1000000;
    dis(:, :) = INF;
    %delta_x = [0, -1, 0, 1, -1, 1, -1, 1];
    %delta_y = [-1, 0, 1, 0, -1, -1, 1, 1];
    delta_x = [-1, 0, 1, -1, 1, -1, 0, 1];
    delta_y = [-1, -1, -1, 0, 0, 1, 1, 1];
    que = zeros([2, 300*500]);
    Ne = 0;
    L = zeros([300, 500]);
    for j=1:500
        for i=1:300
            if (dis(i, j) == INF && picture(i, j) == 1)
                pnt = 1;
                sz = 1;
                dis(i, j) = 0;
                que(1, 1) = i;
                que(2, 1) = j;
                while (pnt <= sz)
                    x = que(1, pnt);
                    y = que(2, pnt);
                   % x
                    %y
                    pnt = pnt + 1;
                    for k=1:size
                        nx = x + delta_x(k);
                        ny = y + delta_y(k);
                        if (isval(nx, ny) == 1 && dis(nx, ny) > dis(x, y) + 1 && picture(x, y) == picture(nx, ny))
                            dis(nx, ny) = dis(x, y) + 1;
                            que(1, sz + 1) = nx;
                            que(2, sz + 1) = ny;
                            sz = sz + 1;
                        end
                    end
                end
                Ne = Ne + 1;
                for k=1:sz
                    L(que(1, k), que(2, k)) = Ne;
            end
        end
    end
end