% True solution
x = 0:0.1:1;
e = exp(1);
y1 = x - (8*sin(pi*x))/(pi^3*(pi^2 + 1));%n = 2 
y2 = x - (8*sin(pi*x))/(pi^3*(pi^2 + 1)) - (8*sin(3*pi*x))/(27*pi^3*(9*pi^2 + 1));%n = 3
y = (2*e-2*e^2)/(e^2-1)*exp(-x)+(2-2*e)/(e^2-1)*exp(x) + x.^2+2;
plot(x,y1,'--o',x,y2,'-.D',x,y,'-*')
legend('n=2拟合结果','n=3拟合结果','真解');