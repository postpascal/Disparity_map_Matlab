function y=gaussian(a)
[x,y,z]=size(a);
imgau=fspecial('gaussian',[11,11],5);
if z>1;
    a(:, :,1)=conv2(double(a(:, :,1)),double(imgau),'same');
    a(:, :,2)=conv2(double(a(:, :,2)),double(imgau),'same');
    a(:, :,3)=conv2(double(a(:, :,3)),double(imgau),'same');%%%%%%%%gaussian smoothing  
else
    a(:, :)=conv2(double(a(:, :)),double(imgau),'same');
end
y=uint8(a);
end

