%����ͼƬ��ת
[fn,pn,fi]=uigetfile('*.*','ѡ��ͼƬ');%ѡ��ͼƬ
bmp=imread([pn fn]);%��ʾԭʼͼ��
A=imrotate(bmp,-50,'bilinear');
[pathstr,name,ext]= fileparts(mfilename('fullpath'));
imwrite(A,[pathstr,'\test\6.jpg'],'jpg')