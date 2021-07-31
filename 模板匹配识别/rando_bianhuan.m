%用于修正角度
function qingxiejiao=rando_bianhuan(I)
I=edge(I);%figure,imshow(I);
% I = zeros(100,100);
% I(25:75, 25:75) = 1;
theta = 1:180;
[R,~] = radon(I,theta);
%figure,imagesc(theta,xp,R);colormap(hot);%title('R_{\theta} (X\prime)')%%imshow(theta,xp,R,[],'n')
[~,J] = find(R>=max(max(R)));%J记录了倾斜角
if J<90
qingxiejiao=-J;
elseif J==90
qingxiejiao=0;
elseif J>90
qingxiejiao=180-J;
end
%直线位置
% xlabel('\theta (degrees)');ylabel('X\prime');
% % colormap(hot)%     colorbar  IMAGE(C) displays matrix C as an image.
% title('R_{\theta} (X\prime)');
% colorbar;