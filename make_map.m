function [disparity_map]=make_map(dis_map,im_l)
[x,y]=size(dis_map);
disparity_map=zeros(x+3,y+3);

for i=1:x
    for j=1:y
        disparity_map(i,j-dis_map(i,j))=im_l(i,j);

    end
end
  
end

