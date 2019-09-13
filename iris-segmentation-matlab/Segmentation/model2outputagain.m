function [I] = model2outputagain(I,x,y,r,xp,yp,r2)
%I= imread('F:\4.2\dip\lab\Segmentation\output\-segmented.jpg');
[nx,ny,d] = size(I) ;
[X,Y] = meshgrid(1:ny,1:nx) ;
%imshow(I) ;
%hold on
%[px,py] = getpts ;   % click at the center and approximate Radius
%r = sqrt(diff(x).^2+diff(y).^2) ;
th = linspace(0,2.*pi) ;
display(r);
display(th);
x=double(x);
y=double(y);
r=double(r);
xp=double(xp);
yp=double(yp);
r2=double(r2);
%xc = x(1)+r.*cos(th) ; 
%yc = y(1)+r.*sin(th) ; 
%xc = x(1)+r ; 
%yc = y(1)+r ; 
%plot(xc,yc,'r') ;
% Keep only points lying inside circle
idx = inpolygon(X(:),Y(:),x,y) ;

for i = 1:d
    I1 = I(:,:,i) ;
    I1(~idx) = 255 ;
    I(:,:,i) = I1 ;
end
idx = inpolygon(X(:),Y(:),xp,yp) ;
for i = 1:d
    I1 = I(:,:,i) ;
    I1(idx) = 255 ;
    I(:,:,i) = I1 ;
end
%figure
%imshow(I)
savepath='F:\4.2\dip\lab\Segmentation\output2\';

imwrite(I,[savepath,'backrmv.jpg'],'jpg');

end

