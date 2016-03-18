%add zero padding
%zero padding width:half_win
function [ adj_im] = add_padding( im,half_win )
[x,y]=size(im);
adj_im=zeros(x+2*half_win,y+2*half_win);
% for i=1:x
%     for j=1:y
%       adj_im(i+half_win,j+half_win)=im(i,j);
%     end
% end
adj_im((1+half_win):(x+half_win),(1+half_win):(y+half_win))=im(:,:);
adj_im=uint8(adj_im);
end

