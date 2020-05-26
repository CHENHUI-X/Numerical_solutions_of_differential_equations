%基函数是sin(i*pi*x),f = x^2
%注题初边值条件非齐次,构造u0(x) = x 
function result_integral_f = Ritz_Galerkin_integral_f(i)
syms x
u = x^2*sin(i*pi*x);%(f,φi)
w = x*sin(i*pi*x) + i*pi*cos(i*pi*x);%a(u(0),φi)
result_integral_f = int(u,x,0,1) - ( int(w,x,0,1) );%
end
%%%%%方程右端项%%%%