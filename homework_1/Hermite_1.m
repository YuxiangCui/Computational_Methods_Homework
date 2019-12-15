% 4-1
% 编制分段埃尔米特三次差值程序，用于被插函数f(x)=5/(1+x^2)。插值区间为【-5，5】，分成十等分，作分段插值多项式y=Hh(x)的图形，并与y=f(x)的图形比较

syms x;
%插值公式
y_h=0;
for  i=0:9
     x0=-5+i;
     x1=-5+i+1;
     a0=(1+2*(x-x0))*(x-x1)^2;
     a1=(1-2*(x-x1))*(x-x0)^2;
     b0=(x-x0)*(x-x1)^2;
     b1=(x-x1)*(x-x0)^2;
     y0=5/(1+x0^2);
     y1=5/(1+x1^2);
     m0=-10*x0/((1+x0^2)^2);
     m1=-10*x1/((1+x1^2)^2);
     y_h=y_h+(a0*y0+a1*y1+b0*m0+b1*m1)*(x>=x0&x<x1);
end
y_h
figure(1)
%插值图像
t=-5:0.1:5;
y_h=eval(subs(y_h,x,t));
plot(t,y_h,'bo');
hold on
%原图像
y=5/(1+x^2);
y=eval(subs(y,x,t));
plot(t,y,'r-');

%调用matlab函数
figure(2)
t_c=-5:0.1:5;
p=pchip(t_c,y,t)
figure(2)
plot(t_c,y,'k+',t,p,'k-')

