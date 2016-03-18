%find disparity 

function [ dis_map] = dis_search(im_l,im_r,half_win,max_search)
[x,y]=size(im_l);
w=half_win;

for i=1+w:x-w
    for j=1+w:y-w
        dx=match_pixel(i,j,max_search,w,im_l,im_r);        
        dis_map(i-w,j-w)=dx;
        
    end
end
end