%%
%What Robot eyes can do 
%Name : Disparity Map maker
%Time:13 Mar 2016 
%Place:University of Dundee
%main function start here

%%
%images input
im_ol=imread('pentagon_left.bmp');
im_or=imread('pentagon_right.bmp');

dim=size(im_ol,3);

if dim >1
    im_ol=rgb2gray(im_ol);
    im_or=rgb2gray(im_or);
end
figure(1)
imshow(im_ol);
%%
%parameters setting
%support window size= 2*half_win+1
half_win=5;
%search region size=2*max_search+1
max_search=11;
%add zero padding
im_l=add_padding(im_ol,half_win);
im_r=add_padding(im_or,half_win);

%find disparity 
[ dis_map] = dis_search(im_l,im_r,half_win,max_search);

%conver disparity into map
disparity_map=make_map(dis_map,im_l);
disparity_map=gaussian(disparity_map);
figure(2)
imshow(disparity_map)