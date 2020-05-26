function result = Runge_Kuuta(start,finish,stride,u0)%依次是 起点,终点,步长.
%题目要求四级四阶方法,对应 m  = 4 , f = tu^2 
u0 = 1 ; %给定初始值
t = start;%t(0)
n = (finish - start)/stride;%结点数
u=[];u(1) = u0;%u(1)实际的u(0)
for i  = 1:n
    k1 = t*u(i)^2;
    k2 = (t + stride/2)*(  u(i) +  stride/2 * k1)^2;
    k3 = (t + stride/2)*(  u(i) +  stride/2 * k2)^2;
    k4 = (t + stride)  *(  u(i) +  stride   * k3)^2;
    u(i+1) = u(i) + stride/6*( k1 + 2*k2 + 2*k3 + k4);
    t = t + stride;
end
result = u ;
% xlswrite('E:\学习\计算机\微分方程数值解\结课上机\实验项目一\result.xlsx',u,'Sheet1','B5');
end
