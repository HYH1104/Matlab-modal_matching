%�ַ�ģ��ƥ��ʶ�𻷽�
%����µ���Ҫʶ�������ʱ��Ҫ��ӱȶ������Ϣ
function mobanpp=mobanpp(mobantupian,chulitupian);
[y,x,z]=size(chulitupian);%��ȡͼƬ����ֵ
for k=1:4  %�˴��ж���ģ���ѭ�����ٴ�
sum=0;
for i=1:y
    for j=1:x
         if  mobantupian(i,j,k)==chulitupian(i,j)%ͳ�ƺڰ�
             sum=sum+1;
        end
    end
end
baifenbi(1,k)=sum/(x*y);%�ٷֱȱȶ�
end
% disp(baifenbi)
chepai= find(baifenbi>=max(baifenbi));
mobanpp=chepai;%�����������У���0��ʼ����Ҫ��1�����ﲻ��
%�ȶ������Ϣ
    if mobanpp==1%��������ʱ�ĵ�һ��ͼƬ
        if baifenbi(1,1)<0.95%0.95Ϊʶ����ֵ,
         mobanpp='ʶ��ʧ��';
        else
         mobanpp='ChenLiming *************';
        end
    elseif mobanpp==2%��������ʱ�ĵڶ���ͼƬ
        if baifenbi(1,2)<0.95
         mobanpp='ʶ��ʧ��';
        else
         mobanpp='������ *************';
        end
    elseif mobanpp==3%��������ʱ�ĵ�����ͼƬ
        if baifenbi(1,3)<0.95
         mobanpp='ʶ��ʧ��';
        else
         mobanpp='���� *************';
        end
    elseif mobanpp==4%��������ʱ�ĵ�����ͼƬ
        if baifenbi(1,4)<0.95
         mobanpp='ʶ��ʧ��';
        else
         mobanpp='����ҵ *************';
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