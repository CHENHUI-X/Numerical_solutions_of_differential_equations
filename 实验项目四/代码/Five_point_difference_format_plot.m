%作图
result=Five_point_difference_format(0,2,0,2,50,50);%区间分为50个
j = 1;
for i = 1:49:2401
z(j,1:49) = result(i:i+48);%将列向量转为网格矩阵
j  = j +1;
end
[x,y] =meshgrid(0.04:0.04:2-0.04);
subplot(1,2,1)
mesh(x,y,z);
title('五点差分格式解');
subplot(1,2,2)
mesh(x,y,x.^2-y.^2);
title('真解');
