%%function [optdx]=match_pixel(i,j,max_search,im_l,im_r)
%im_l:left image, im_r:right image
%(i,j):coordinate of pixel
%max_search: half size of search region
%optmax: distance from (i,j)
%w:half size of support window

%%
function [optdx]=match_pixel(i,j,max_search,w,im_l,im_r)
[m,n]=size(im_l);
a=zeros(2*max_search+1,2*max_search+1);
%get search region
if j<=max_search
    y=j;
else
    y=j-max_search;
end
if n-j<max_search
    ye=n;
else
    ye=j+max_search;
end
if i<=max_search
    x=i;
else
    x=i-max_search;
end
if m-i<max_search
    xe=m;
else
    xe=i+max_search;
end
a=im_r(x:xe,y:ye);
%%
%using SSD
mincd=Inf;
for r_j=y+w:ye-w
    cd=(im_l(i-w:i+w,j-w:j+w)-im_r(i-w:i+w,r_j-w:r_j+w)).^2;
    sum_cd=sum(cd ,2);
    sum_cd =sum(sum_cd);
    if sum_cd<mincd;
        mincd=sum_cd;
        optdx=j-r_j;%from left to right, so j>r_j
    end
end
end


