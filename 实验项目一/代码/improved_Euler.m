function result = improved_Euler(start,finish,stride,u0)%依次是 起点,终点,步长,初始值
%预报矫正的改进的欧拉法
n = (finish - start)/stride;%结点数
u=[];u(1) = u0;%u(1)是实际上的u(0)
t = start;%t(0)
for i = 1 : n
    u(i+1) = u(i) + stride/2*( ... 
            t * u(i)^2 ... % f(t,u)= t(i)*u(i)^2       
                          +...
           ( t + stride )*( u(i) + stride*  t *u(i)^2 )^2  );
             %f( t+h,u(i+1) ) = t(i+1)*(u(i) + h*f(t,u))^2,预报矫正  
     t = t + stride;
end
result = u;
% xlswrite('E:\学习\计算机\微分方程数值解\结课上机\实验项目一\result.xlsx',u,'Sheet1','B3');
end