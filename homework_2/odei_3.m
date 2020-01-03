x=(0:0.005:2)';
y=x.^2.*exp(-x)+cos(2*x);

%R-K
y=zeros(401,1);
y(1,1)=1;
h=0.005;
for i=1:400
    if i==4
        time_RK_start=now*10e12;
    end
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
time_RK_end=now*10e12;
time_RK=time_RK_end-time_RK_start

%Adams
time_Adams_start=now*10e12;
yc=zeros(401,1);
yp=zeros(401,1);
ypm=zeros(401,1);
for i=4:400
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
time_Adams_end=now*10e12;
time_Adams=time_Adams_end-time_Adams_start