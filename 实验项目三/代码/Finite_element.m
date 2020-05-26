function result = Finite_element(Interval_number)%参数所需离散成的区间个数
h = 1/Interval_number;%步长
k = zeros(Interval_number,Interval_number);%刚度矩阵-系数矩阵
b = zeros(Interval_number,1);%刚度矩阵-解矩阵
Number_nodes = Interval_number + 1;%结点个数是所需区间个数+1
x(1) =0;%结点矩阵
for i = 2:Number_nodes  
        x(i) = x(1)+ (i-1)*h;
end
for a = 2:Number_nodes %a=2时,得到的是a(φ1,φ1)
    [result1,result2] =  Finite_element_a_f(a,h,x,Interval_number);
    k = k + result1;
    b = b + result2;
end
result = k\b;%求解出y
end
