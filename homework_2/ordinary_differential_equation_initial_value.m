%准确值
x_accurate = (0:0.1:2)
y_accurate = x_accurate .^ 2 .* exp(-x_accurate) + cos(2 * x_accurate)

%figure(1)
%plot(x_accurate,y_accurate)

%ode23
[x_ode23,y_ode23]=ode23(@(x,y)-y+cos(2*x)-2*sin(2*x)+2*x*exp(-x),(0:0.1:2),1)

%figure(2)
%plot(x_ode23,y_ode23)

%ode45
[x_ode45,y_ode45]=ode45(@(x,y)-y+cos(2*x)-2*sin(2*x)+2*x*exp(-x),(0:0.1:2),1)

%figure(3)
%plot(x_ode45,y_ode45)

%R-K
x = (0:0.1:2);
x = x';
y = zeros(21,1);
y(1,1)=1;
h=0.1;
for i=1:20
    xn=x(i,1);
    yn=y(i,1);
    k1=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i,1)+h/2;
    yn=y(i,1)+k1*h/2;
    k2=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i,1)+h/2;
    yn=y(i,1)+k2*h/2;
    k3=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i,1)+h;
    yn=y(i,1)+k3*h;
    k4=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    y(i+1,1)=y(i,1)+(k1+2*k2+2*k3+k4)*h/6;
end
y
%figure(4)
%plot(x_accurate,y)


%Adams方法
yc=zeros(21,1);
yp=zeros(21,1);
ypm=zeros(21,1);
for i=4:20
    xn=x(i,1);
    yn=y(i,1);
    fn=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i-1,1);
    yn=y(i-1,1);
    fn1=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i-2,1);
    yn=y(i-2,1);
    fn2=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i-3,1);
    yn=y(i-3,1);
    fn3=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    yp(i+1,1)=y(i,1)+h*(55*fn-59*fn1+37*fn2-9*fn3)/24;
    ypm(i+1,1)=yp(i+1,1)+251*(yc(i,1)-yp(i,1))/270;
    
    xn=x(i+1,1);
    yn=ypm(i+1,1);
    fpm=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    yc(i+1,1)=y(i,1)+h*(9*fpm+19*fn-5*fn1+fn2)/24;
    y(i+1,1)=yc(i+1,1)-19*(yc(i+1,1)-yp(i+1,1))/270;
end
y