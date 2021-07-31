%���ڶ�λ
clc;
clear all;
close all;
warning off
m=1;%ͼƬ������ϵ������ʶ��ɹ���Ӱ��ܴ����ͼƬ����ԱȶȺܸ�ֵ��Ϊ1���ɣ�������߽ϰ����ʵ������ֵ��֮��Ȼ��
[fn,pn,fi]=uigetfile('*.*','ѡ��ͼƬ');%ѡ��ͼƬ
bmp=imread([pn fn]);%��ʾԭʼͼ��
figure(1)
imshow(bmp);
title('ԭʼ����ͼ��');
%%%%%%%%%%ͼ��HSV����%%%%%%%%%%   
myhsv=rgb2hsv(bmp);%��ͼ�����HSV����
h=myhsv(:,:,1);
s=myhsv(:,:,2);
v=myhsv(:,:,3);
%%%%%%%%%%ͼ����ֵ�˲�%%%%%%%%%%
bmp=medfilt2(v,[3,3]);
% figure(2);subplot(221);imshow(bmp);title('��ֵ�˲�ͼ��');
%%%%%%%%%%ͼ���ֵ����%%%%%%%%%%
A=im2bw(v,0.3);%��ͼ����ж�ֵ������
%%%%%%%%ͼ������̬ѧ����%%%%%%%%%
zfwz=[100 320 150 100];
B=bwmorph(A,'spur',inf);%figure,imshow(bw);title('����֮ǰ');
B=im2bw(B,0.5);
imshow(B);
B=imcrop(B,[100 300 200 150]);%������������ϲ�Ĳ��ּ�������
grayimg = B;BWimg = grayimg;[width,height]=size(grayimg);%�Ҷ�ͼ���ݴ��ݣ�������
A=im2bw(B,0.5);     % thresh=0.5 ��ʾ���Ҷȵȼ���128���µ�����ȫ����Ϊ��ɫ�����Ҷȵȼ���128���ϵ�����ȫ����Ϊ��ɫ��
bw = edge(A,'sobel','vertical'); figure(2); imshow(bw);title("��Եͼ��"); % ��ֱ��Ե��� 
Z = strel('rectangle',[30,18]);%��ͨ����
bw_close=imclose(bw,Z);%��ͨ��մ���
bw_open = imopen(bw,Z);%��ͨ�򿪴���
showImg = grayimg;%�Ҷ�ͼ���ݴ���
%ͼ�����ݶ�ֵ������,���ͼ��߶ȹ����ʹ����ʱ�伸�α����ӣ����Ծ���ʹ��С�߶�ͼƬ�������ͼƬ��ȫOK�����ṩ������ͼƬ�����ڹ������
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
imshow(showImg);%���ӻ���ʾ��ֵ��ͼ��
[l,m] = bwlabel(bw_close);  %�������ǩ
status=regionprops(l,'BoundingBox');%ͼ���������
centroid = regionprops(l,'Centroid');%�ַ��������
imshow(B);hold on;
a=[0 0 0 0];
if m>1
for i=1:m
if status(i).BoundingBox(1,3) > status(i).BoundingBox(1,4)%��һ��Ԥ����
    status(i).BoundingBox(1,4)=status(i).BoundingBox(1,3);
else
    status(i).BoundingBox(1,3)=status(i).BoundingBox(1,4);
end
   status(i).BoundingBox=status(i).BoundingBox+a;
    rectangle('position',status(i).BoundingBox,'edgecolor','g');%�ַ�����
    text(centroid(i,1).Centroid(1,1)-25,centroid(i,1).Centroid(1,2)-25, num2str(i),'Color', 'r') %�ַ�����
end 
end
