clear
a = 16;
r = 30;
b = 4;
f1 = @(x) a*(x(2) - x(1));
f2 = @(x) x(1)*(r - x(3)) - x(2);
f3 = @(x) x(1)*x(2) - b*x(3);
iter = 10000;
x = [1,1,1];
x(iter + 1,:) = [NaN,NaN,NaN];
h = .005;
for n = 1:iter
    xx = rkODE(f1,x(:,n),h);
    yy = rkODE(f2,x(:,n),h);
    zz = rkODE(f3,x(:,n),h);
    x(1, n + 1) = xx(1);
    x(2, n + 1) = yy(2);
    x(3, n + 1) = zz(3);
end
plot3(x(1,:),x(2,:),x(3,:),'k')
