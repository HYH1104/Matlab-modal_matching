%将模板图片批量搬移，每个参数分别对应一张图片
%添加新的需要识别的名牌时需要添加模板参量
function maopao=maopaopp(a,b,c,d)
%有多少个模板就添加多少个参量
maopao(:,:,1)  =a;
maopao(:,:,2)  =b;
maopao(:,:,3)  =c;
maopao(:,:,4)  =d;
% maopao(:,:,5)  =f;
% maopao(:,:,6)  =g;
% maopao(:,:,7)  =h;
% maopao(:,:,8)  =i;
% maopao(:,:,9)  =j;