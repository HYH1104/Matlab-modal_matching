%用于定位
clc;
clear all;
close all;
warning off
m=1;%图片的亮度系数对与识别成功率影响很大，如果图片本身对比度很高值设为1即可，如果光线较暗可适当提高数值反之亦然。
[fn,pn,fi]=uigetfile('*.*','选择图片');%选择图片
bmp=imread([pn fn]);%显示原始图像
figure(1)
imshow(bmp);
title('原始名牌图像');
%%%%%%%%%%图像HSV处理%%%%%%%%%%   
myhsv=rgb2hsv(bmp);%对图像进行HSV处理
h=myhsv(:,:,1);
s=myhsv(:,:,2);
v=myhsv(:,:,3);
%%%%%%%%%%图像中值滤波%%%%%%%%%%
bmp=medfilt2(v,[3,3]);
% figure(2);subplot(221);imshow(bmp);title('中值滤波图像');
%%%%%%%%%%图像二值处理%%%%%%%%%%
A=im2bw(v,0.3);%对图像进行二值化处理
%%%%%%%%图像做形态学处理%%%%%%%%%
zfwz=[100 320 150 100];
B=bwmorph(A,'spur',inf);%figure,imshow(bw);title('擦除之前');
B=im2bw(B,0.5);
imshow(B);
B=imcrop(B,[100 300 200 150]);%将含有名牌欣喜的部分剪裁下来
grayimg = B;BWimg = grayimg;[width,height]=size(grayimg);%灰度图数据传递，导入宽高
A=im2bw(B,0.5);     % thresh=0.5 表示将灰度等级在128以下的像素全部变为黑色，将灰度等级在128以上的像素全部变为白色。
bw = edge(A,'sobel','vertical'); figure(2); imshow(bw);title("边缘图像"); % 垂直边缘检测 
Z = strel('rectangle',[30,18]);%连通域处理
bw_close=imclose(bw,Z);%连通域闭处理
bw_open = imopen(bw,Z);%连通域开处理
showImg = grayimg;%灰度图数据传递
%图像数据二值化处理,如果图像尺度过大会使处理时间几何倍增加，所以尽量使用小尺度图片，（你的图片完全OK）我提供个测试图片就属于过大的了
for i=1:width  
    for j=1:height
        if(BWimg(i,j) == 255)
            showImg(i,j)= grayimg(i,j);
        else 
            showImg(i,j)= 0;
        end
    end
end
figure(3);
imshow(showImg);%可视化显示二值化图像
[l,m] = bwlabel(bw_close);  %连续域标签
status=regionprops(l,'BoundingBox');%图像区域度量
centroid = regionprops(l,'Centroid');%字符区域度量
imshow(B);hold on;
a=[0 0 0 0];
if m>1
for i=1:m
if status(i).BoundingBox(1,3) > status(i).BoundingBox(1,4)%归一化预处理
    status(i).BoundingBox(1,4)=status(i).BoundingBox(1,3);
else
    status(i).BoundingBox(1,3)=status(i).BoundingBox(1,4);
end
   status(i).BoundingBox=status(i).BoundingBox+a;
    rectangle('position',status(i).BoundingBox,'edgecolor','g');%字符画框
    text(centroid(i,1).Centroid(1,1)-25,centroid(i,1).Centroid(1,2)-25, num2str(i),'Color', 'r') %字符框标号
end 
end
