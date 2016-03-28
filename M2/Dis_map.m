%%
%What Robot eyes can do
%Name : Disparity Map maker
%Time:13 Mar 2016
%Place:University of Dundee
%main function start here
%M2
%%
%images input
% im_ol=imread('pentagon_left.bmp');
% im_or=imread('pentagon_right.bmp');
im_ol=imread('scene_l.bmp');
im_or=imread('scene_r.bmp');
[x,y,z]=size(im_ol);
win=11;
max_dis=20;
weight=5;
[gra_l_x gra_l_y]=gradient(double(im_ol));
[gra_r_x gra_r_y]=gradient(double(im_or));
im_l=zeros(x,y,3);
im_r=zeros(x,y,3);
%make a image matrix
im_l(:,:,1)=im_ol;
im_r(:,:,1)=im_or;
im_l(:,:,2)=gra_l_x;
im_r(:,:,2)=gra_r_x;
im_l(:,:,3)=gra_l_y;
im_r(:,:,3)=gra_r_y;
figure(1)
imshow(im_ol);
%%
disparity=make_dis(im_l,im_r,win,max_dis,weight);
figure(2)
imagesc(disparity)
