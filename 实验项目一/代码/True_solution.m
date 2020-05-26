t = 0:0.1:1;
u = -1./(t.^2/2 - 1);
plot(t,u,'-')
% xlswrite('E:\学习\计算机\微分方程数值解\结课上机\实验项目一\result.xlsx',u,'Sheet1','B6');
% True solution