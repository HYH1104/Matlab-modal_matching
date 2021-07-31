%字符模板匹配识别环节
%添加新的需要识别的名牌时需要添加比对输出信息
function mobanpp=mobanpp(mobantupian,chulitupian);
[y,x,z]=size(chulitupian);%获取图片参数值
for k=1:4  %此处有多少模板就循环对少次
sum=0;
for i=1:y
    for j=1:x
         if  mobantupian(i,j,k)==chulitupian(i,j)%统计黑白
             sum=sum+1;
        end
    end
end
baifenbi(1,k)=sum/(x*y);%百分比比对
end
% disp(baifenbi)
chepai= find(baifenbi>=max(baifenbi));
mobanpp=chepai;%在数字排序中，从0开始所以要减1，这里不用
%比对输出信息
    if mobanpp==1%批量搬运时的第一张图片
        if baifenbi(1,1)<0.95%0.95为识别阈值,
         mobanpp='识别失败';
        else
         mobanpp='ChenLiming *************';
        end
    elseif mobanpp==2%批量搬运时的第二张图片
        if baifenbi(1,2)<0.95
         mobanpp='识别失败';
        else
         mobanpp='陈力明 *************';
        end
    elseif mobanpp==3%批量搬运时的第三张图片
        if baifenbi(1,3)<0.95
         mobanpp='识别失败';
        else
         mobanpp='焦栋 *************';
        end
    elseif mobanpp==4%批量搬运时的第四张图片
        if baifenbi(1,4)<0.95
         mobanpp='识别失败';
        else
         mobanpp='张兆业 *************';
        end        
%     elseif mobanpp==5
%          mobanpp='****';
%     elseif mobanpp==6
%          mobanpp='****';
%     elseif mobanpp==7
%          mobanpp='****';
%     elseif mobanpp==8
%          mobanpp='****';
%     elseif mobanpp==9
%          mobanpp='****';
end