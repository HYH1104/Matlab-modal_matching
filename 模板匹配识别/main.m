%���н��沿��
warning('off');
close all;
chos=0;%��ʼ���水ť����
possibility=3;%�˳����水ť����
while chos~=possibility
chos=menu('�������Ϣʶ��ϵͳ','ѡ������ƽ���ģ��','  ѡ������ƿ�ʼ����ʶ��  ','������������');%������ť���ƣ���һ��Ϊ��ͼ�λ����ڵ�����
if chos==1 %�����ȡ�İ���Ϊ'ѡ������ƽ���ģ��'����
clc;
clear all;
close all;
warning off
[fn,pn,fi]=uigetfile('*.*','ѡ��ͼƬ');%ѡ��ͼƬ
bmp=imread([pn fn]);%��ʾԭʼͼ��  
figure(1)
imshow(bmp);title('ԭʼ����ͼ��');
%%%%%%%%%%ͼ��HSV����%%%%%%%%%% 
mysize=size(bmp);%�ж�ͼ��ɫ��
if numel(mysize)>2 %�ж��Ƿ���rgbͼ��  
myhsv=rgb2hsv(bmp);%��ͼ�����HSV����
h=myhsv(:,:,1);
s=myhsv(:,:,2);
v=myhsv(:,:,3);
%%%%%%%%%%ͼ����ֵ�˲�%%%%%%%%%%
bmp=medfilt2(v,[3,3]);
%%%%%%%%%%ͼ���ֵ����%%%%%%%%%%
A=im2bw(v,0.3);%��ͼ����ж�ֵ������
else
    A=bmp;
end
%%%%%%%%ͼ������̬ѧ����%%%%%%%%%
zfwz=[100 320 150 100];
B=bwmorph(A,'spur',inf);%��ͼ�������̬ѧ����
B=im2bw(B,0.5);
rectangle('position',zfwz,'edgecolor','r');%�ַ�����
C=imcrop(B,zfwz);%���򲿷�ͼ���ȡ
C=imcomplement(C);%��ͼ����кڰ׷�ת
figure(2)
imshow(C);
pics=dir('*.bmp');MBS=length(pics);
[pathstr,name,ext]= fileparts(mfilename('fullpath'));
imwrite(C,[pathstr,'\',num2str(MBS),'.bmp'],'bmp')
chos=0;
possibility=3;
end

if chos==2  %�����ȡ�İ���Ϊ'ѡ������ƿ�ʼ����ʶ��'����
clc;
clear all;
close all;
warning off
[fn,pn,fi]=uigetfile('*.*','ѡ��ͼƬ');%ѡ��ͼƬ
bmp=imread([pn fn]);%��ʾԭʼͼ��
figure(1)
imshow(bmp);title('ԭʼ����ͼ��');
%%%%%%%%%%ͼ��HSV����%%%%%%%%%%   
myhsv=rgb2hsv(bmp);%��ͼ�����HSV����
h=myhsv(:,:,1);
s=myhsv(:,:,2);
v=myhsv(:,:,3);
figure(2)
subplot(131);imshow(h);title('HSVת�����H����');
subplot(132);imshow(s);title('HSVת�����S����');
subplot(133);imshow(v);title('HSVת�����V����');
%%%%%%%%%%ͼ����ֵ�˲�%%%%%%%%%%
bmp=medfilt2(v,[3,3]);
% figure(2);subplot(221);imshow(bmp);title('��ֵ�˲�ͼ��');
%%%%%%%%%%ͼ���ֵ����%%%%%%%%%%
A=im2bw(v,0.5);%��ͼ����ж�ֵ������
%%%%%%%%%%%%%%%%%%%%%��бУ��%%%%%%%%%%%%%%%%%%%%%%
qingxiejiao=rando_bianhuan(A);
A=imrotate(A,qingxiejiao,'bilinear','crop');
figure,imshow(A);title('��бУ��');%ȡֵΪ��ֵ������ת
[pathstr,name,ext]= fileparts(mfilename('fullpath'));
imwrite(A,[pathstr,'\xxx.bmp'],'bmp')
%%%%%%%%%%%%%%%%%%%%%��ȥ�ڱ�%%%%%%%%%%%%%%%%%%%%%%
a = imread([pathstr,'\xxx.bmp']);        %��ȡͼƬ
delete([pathstr,'\xxx.bmp']);
A=caiquhei(a);
figure(3),imshow(A);
%%%%%%%%ͼ������̬ѧ����%%%%%%%%%
zfwz=[100 320 150 100];
B=bwmorph(A,'spur',inf);%figure,imshow(bw);title('����֮ǰ');
B=im2bw(B,0.5);
figure(4)
imshow(B);
rectangle('position',zfwz,'edgecolor','r');%�ַ�����
C=imcrop(B,zfwz);%���򲿷�ͼ���ȡ
C=imcomplement(C);%��ͼ����кڰ׷�ת
figure(5)
imshow(C);
mobanpun=maopaopp(imread('0.bmp'),imread('1.bmp'),imread('2.bmp'),imread('3.bmp'));
jieguohanzi  = mobanpp(mobanpun,C);
hs=msgbox(['������Ϣʶ����Ϊʶ����Ϊ��',jieguohanzi],'result');
pause(1);
close(hs);
%disp(jieguohanzi)   
chos=0;
possibility=3;
end 
  
end