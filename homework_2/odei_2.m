%准确值
x=(0:0.1:2)'
y=x.^2.*exp(-x)+cos(2*x);

%h
yh=zeros(21,1);
yh(1,1)=1;
h=0.1;
for i=1:20
    xn=x(i,1);
    yn=yh(i,1);
    k1=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i,1)+h/2;
    yn=yh(i,1)+k1*h/2;
    k2=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i,1)+h/2;
    yn=yh(i,1)+k2*h/2;
    k3=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(i,1)+h;
    yn=yh(i,1)+k3*h;
    k4=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    yh(i+1,1)=yh(i,1)+(k1+2*k2+2*k3+k4)*h/6;
end
yh
%2h
y2h=zeros(11,1);
y2h(1,1)=1;
h=0.2;
for i=1:10
    xn=x(2*i-1,1);
    yn=y2h(i,1);
    k1=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(2*i-1,1)+h/2;
    yn=y2h(i,1)+k1*h/2;
    k2=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(2*i-1,1)+h/2;
    yn=y2h(i,1)+k2*h/2;
    k3=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    xn=x(2*i-1,1)+h;
    yn=y2h(i,1)+k3*h;
    k4=-yn+cos(2*xn)-2*sin(2*xn)+2*xn*exp(-xn);
    
    y2h(i+1,1)=y2h(i,1)+(k1+2*k2+2*k3+k4)*h/6;
end
y2h
%外推
yh2h=zeros(11,1);
for i=1:11
    yh2h(i,1)=(16*yh(2*i-1,1)-y2h(i,1))/15;
end
yh2h