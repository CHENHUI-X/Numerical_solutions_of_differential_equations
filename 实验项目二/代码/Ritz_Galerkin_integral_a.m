%基函数是sin(i*pi*x)
%计算a(φi,φj)
function result_integral_a = Ritz_Galerkin_integral_a(i,j)
syms x
fail = sin(i*pi*x)*sin(j*pi*x) + i*pi*cos(i*pi*x)*j*pi*cos(j*pi*x);
result_integral_a = int(fail,x,0,1);
end
%%%%%%%方程左端项%%%%%%