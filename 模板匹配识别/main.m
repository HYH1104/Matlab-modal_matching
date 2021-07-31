%运行界面部分
warning('off');
close all;
chos=0;%初始界面按钮参数
possibility=3;%退出界面按钮参数
while chos~=possibility
chos=menu('身份牌信息识别系统','选择身份牌建立模板','  选择身份牌开始进行识别  ','》》结束《《');%各个按钮名称，第一个为该图形化窗口的名称
if chos==1 %如果获取的按键为'选择身份牌建立模板'按键
clc;
clear all;
close all;
warning off
[fn,pn,fi]=uigetfile('*.*','选择图片');%选择图片
bmp=imread([pn fn]);%显示原始图像  
figure(1)
imshow(bmp);title('原始名牌图像');
%%%%%%%%%%图像HSV处理%%%%%%%%%% 
mysize=size(bmp);%判断图像色度
if numel(mysize)>2 %判断是否是rgb图像  
myhsv=rgb2hsv(bmp);%对图像进行HSV处理
h=myhsv(:,:,1);
s=myhsv(:,:,2);
v=myhsv(:,:,3);
%%%%%%%%%%图像中值滤波%%%%%%%%%%
bmp=medfilt2(v,[3,3]);
%%%%%%%%%%图像二值处理%%%%%%%%%%
A=im2bw(v,0.3);%对图像进行二值化处理
else
    A=bmp;
end
%%%%%%%%图像做形态学处理%%%%%%%%%
zfwz=[100 320 150 100];
B=bwmorph(A,'spur',inf);%对图像进行形态学处理
B=im2bw(B,0.5);
rectangle('position',zfwz,'edgecolor','r');%字符画框
C=imcrop(B,zfwz);%画框部分图像截取
C=imcomplement(C);%对图像进行黑白反转
figure(2)
imshow(C);
pics=dir('*.bmp');MBS=length(pics);
[pathstr,name,ext]= fileparts(mfilename('fullpath'));
imwrite(C,[pathstr,'\',num2str(MBS),'.bmp'],'bmp')
chos=0;
possibility=3;
end

if chos==2  %如果获取的按键为'选择身份牌开始进行识别'按键
clc;
clear all;
close all;
warning off
[fn,pn,fi]=uigetfile('*.*','选择图片');%选择图片
bmp=imread([pn fn]);%显示原始图像
figure(1)
imshow(bmp);title('原始名牌图像');
%%%%%%%%%%图像HSV处理%%%%%%%%%%   
myhsv=rgb2hsv(bmp);%对图像进行HSV处理
h=myhsv(:,:,1);
s=myhsv(:,:,2);
v=myhsv(:,:,3);
figure(2)
subplot(131);imshow(h);title('HSV转化后的H分量');
subplot(132);imshow(s);title('HSV转化后的S分量');
subplot(133);imshow(v);title('HSV转化后的V分量');
%%%%%%%%%%图像中值滤波%%%%%%%%%%
bmp=medfilt2(v,[3,3]);
% figure(2);subplot(221);imshow(bmp);title('中值滤波图像');
%%%%%%%%%%图像二值处理%%%%%%%%%%
A=im2bw(v,0.5);%对图像进行二值化处理
%%%%%%%%%%%%%%%%%%%%%倾斜校正%%%%%%%%%%%%%%%%%%%%%%
qingxiejiao=rando_bianhuan(A);
A=imrotate(A,qingxiejiao,'bilinear','crop');
figure,imshow(A);title('倾斜校正');%取值为负值向右旋转
[pathstr,name,ext]= fileparts(mfilename('fullpath'));
imwrite(A,[pathstr,'\xxx.bmp'],'bmp')
%%%%%%%%%%%%%%%%%%%%%裁去黑边%%%%%%%%%%%%%%%%%%%%%%
a = imread([pathstr,'\xxx.bmp']);        %读取图片
delete([pathstr,'\xxx.bmp']);
A=caiquhei(a);
figure(3),imshow(A);
%%%%%%%%图像做形态学处理%%%%%%%%%
zfwz=[100 320 150 100];
B=bwmorph(A,'spur',inf);%figure,imshow(bw);title('擦除之前');
B=im2bw(B,0.5);
figure(4)
imshow(B);
rectangle('position',zfwz,'edgecolor','r');%字符画框
C=imcrop(B,zfwz);%画框部分图像截取
C=imcomplement(C);%对图像进行黑白反转
figure(5)
imshow(C);
mobanpun=maopaopp(imread('0.bmp'),imread('1.bmp'),imread('2.bmp'),imread('3.bmp'));
jieguohanzi  = mobanpp(mobanpun,C);
hs=msgbox(['名牌信息识别结果为识别结果为：',jieguohanzi],'result');
pause(1);
close(hs);
%disp(jieguohanzi)   
chos=0;
possibility=3;
end 
  
end