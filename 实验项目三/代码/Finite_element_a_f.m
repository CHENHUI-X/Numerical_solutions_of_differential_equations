%计算a(u,v) = 积分(u'v'+pi^2/4*uv)和 积分(f,φ)
function [k_cache,b_cache]= Finite_element_a_f(a,h,x,Interval_number)
%参数分别是 a区间右端点,h步长,x端点矩阵,所需离散成的区间个数
k_cache = zeros(Interval_number,Interval_number);%缓存矩阵,存放每次计算得到的单刚矩阵
b_cache = zeros(Interval_number,1);%同上
syms t%构造插值基函数
fail_l = ( x(a) - t )/h;
fail_r = ( t - x(a-1) )/h;
if a == 2
    fail_l = 0;end %第一个小区间没有φ左
%%%%%%%%%%%%%%%%%%%%
%上述基函数构造代码思想:计算每个小区间上对应左右端点的插值基函数,循环覆盖
%比如 计算第一个小区间x1对应的插值基函数fail1时,x1在第一个区间上对应的是
%一个区间右端点,此时x1对应基函数应该带入fail_r中
%但是在第二个小区间上计算新的fail1和fail2时,这时x1对第二个小区间的左端点
%此时x1对应的基函数应该带入fail_l中
%%%%%%%%%%%%%%%%%%%%
%构造系数矩阵的被积函数
a1 = diff(fail_l)*diff(fail_l) + pi^2/4*fail_l*fail_l;%左上
a2 = diff(fail_l)*diff(fail_r) + pi^2/4*fail_l*fail_r;%右上和左下
a3 = diff(fail_r)*diff(fail_r) + pi^2/4*fail_r*fail_r;%右下
if a==2 a1=0;a2=0;end %第一个小区间系数阵只有左上角有元素,但这个左上角元素是由fail_r和fail_r得到的
%构造解矩阵的被积函数
b1 = 2*sin(pi/2 * t) * fail_l;
b2 = 2*sin(pi/2 * t) * fail_r;
if a == 2 %第一个小区间系数矩阵和解矩阵的计算
    k_cache(1,1) = int(a3,t,x(a-1),x(a));
    b_cache(1) = int(b2,t,x(a-1),x(a));
else%其他小区间系数矩阵和解矩阵的计算
    k_cache(a-2,a-2) = int(a1,t,x(a-1),x(a));
    k_cache(a-2,a-1) = int(a2,t,x(a-1),x(a));
    k_cache(a-1,a-2) = k_cache(a-2,a-1);
    k_cache(a-1,a-1) = int(a3,t,x(a-1),x(a));
    b_cache(a-2) = int(b1,t,x(a-1),x(a));
    b_cache(a-1) = int(b2,t,x(a-1),x(a));
end
end