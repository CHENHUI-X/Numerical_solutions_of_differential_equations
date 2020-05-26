function result = Euler(start,finish,stride,u0)%依次是 起点,终点,步长,初始值
n = (finish - start)/stride;%结点数
t = start;%t(0)
u=[];u(1) = u0;%初始值相同
for i = 1 : n    
    u(i+1) = u(i) + stride * t * u(i)^2;
    t = t + stride;
end
result = u;
% xlswrite('E:\学习\计算机\微分方程数值解\结课上机\实验项目一\result.xlsx',u,'Sheet1','B2');
end
