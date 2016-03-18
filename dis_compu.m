function dis_map=dis_compu(im_l,im_r,window_size,maxdsp)
[x,y]=size(im_l);
dispari_buf=zeros(x,y,maxdsp);
min_dis=Inf;
dis_map=ones(x,y);
for d=1:maxdsp
    dispari_buf(:,1:d,d)=255;
    dispari_buf(:,d:y,d)=(im_l(:,d:y)-im_r(:,1:y-d+1)).^2;
    sum_dis=sum(sum(dispari_buf(:,d:y,d),2));
    if sum_dis<min_dis
        min_dis=sum_dis;
        dis_map=dispari_buf(:,:,d);
    end
end
%gaussian filter, to make image smooth
% dis_map=gaussian(dis_map);
end
