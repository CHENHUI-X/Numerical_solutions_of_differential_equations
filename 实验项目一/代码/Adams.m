function result = Adams(start,finish,stride,u0 )%依次是 起点,终点,步长.,u(0),此代码为2阶的
n = (finish - start)/stride;%结点数
%题目要求采用2阶的Adams外插法,但是只给了一个结点的初始值,因此还需要一个初始值
%利用改进欧拉法对u1进行预报,即代码中的u(2)
u=[];u(1) = u0;%u(1)是实际上的u(0)
t = start;%t(0)
u(2) = u(1) + stride/2*( ... 
            t * u(1)^2 ... % f(t,u)= t(i)*u(i)^2       
                          +...
           ( t + stride )*( u(1) + stride*  t *u(1)^2 )^2  );
             %f( t+h,u(i+1) ) = t(i+1)*(u(i) + h*f(t,u))^2,预报矫正  
t = t + stride; 
% 从而得到u0 u1两个初始值 分别存储在u(1)u(2)中
for i  = 2:n
    u(i+1) = u(i) + stride/2*( 3*t*u(i)^2 - (t-stride)*u(i-1)^2 );
    t = t + stride; 
end
result = u;
% xlswrite('E:\学习\计算机\微分方程数值解\结课上机\实验项目一\result.xlsx',u,'Sheet1','B4');
end