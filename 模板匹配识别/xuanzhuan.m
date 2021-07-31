%用于图片旋转
[fn,pn,fi]=uigetfile('*.*','选择图片');%选择图片
bmp=imread([pn fn]);%显示原始图像
A=imrotate(bmp,-50,'bilinear');
[pathstr,name,ext]= fileparts(mfilename('fullpath'));
imwrite(A,[pathstr,'\test\6.jpg'],'jpg')