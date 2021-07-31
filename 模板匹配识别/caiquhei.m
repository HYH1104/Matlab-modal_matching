%用于裁去修正角度后的图片的黑边
function caiqu=caiquhei(a)
a =a;        %读取图片
A=[];
for i=1:size(a,1)
    for j=1:size(a,2)
         A(i,j)=sum(a(i,j,:)); 
    end
end
[ss,zz]=find(A==max(max(A)));
z=1;
while(sum(a(ss,z,:))==0)
    z=z+1; 
end
y=size(a,2);
while(sum(a(ss,y,:))==0)
    y=y-1; 
end
s=1;
while(sum(a(s,zz,:))==0)
    s=s+1;
end
x=size(a,1);
while(sum(a(x,zz,:))==0)
    x=x-1;
end
aa=a(s:x,z:y,:);
caiqu=aa;
end