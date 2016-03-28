function disparity=make_dis(im_l,im_r,win,max_dis,weight)
[x,y,z]=size(im_l);

min2_dis=Inf(x,y);
flat_dis=zeros(x,y);
a=ones(win,win);
disparity=zeros(x,y);
for i=1:max_dis
    min3_dis=zeros(x,y,z);
    min3_dis(:,i:y,:)=(im_l(:,i:y,:)-im_r(:,1:y-i+1,:)).^2;

    flat_dis=min3_dis(:,:,1)+weight*(min3_dis(:,:,2)+min3_dis(:,:,3));
    flat_dis=conv2(flat_dis,a,'same');
    ind=find(flat_dis<min2_dis);
    disparity(ind)=i;
    min2_dis(ind)=flat_dis(ind);
end
disparity=gaussian(disparity);
end

