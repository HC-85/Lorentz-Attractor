%The Lorenz Attractor
clear
%------------------------------------------------------------------------%
%x : convective intensity
x0 = 1;
%y : temperature
y0 = 1;
%z : deviation from linearity in the vertical convection profile
z0 = 1;
%a : Prandtl number - fluid property
a = 16;
%r : Rayleigh number - related to deltaT - bif: 29.47182~29.47183
%r = linspace(29.4718265,29.4718275,1000);
r = 30;
%b : aspect ratio of the fluid sheet
b = 4;
%------------------------------------------------------------------------%
dt = .001;
iter = 200000;
x = zeros(iter,length(r));y = x;z = x;
x(1,:) = x0; y(1,:) = y0; z(1,:) = z0;
for k = 1:length(r)
    for n = 2:iter
        dx = a*(y(n-1,k) - x(n-1,k));
        dy = x(n-1,k).*(r(k) - z(n-1,k)) - y(n-1,k);
        dz = x(n-1,k).*y(n-1,k) - b*z(n-1,k);
        x(n,k) = x(n-1,k) + dx*dt;
        y(n,k) = y(n-1,k) + dy*dt;
        z(n,k) = z(n-1,k) + dz*dt;
    end
end

if 1==1
    h = animatedline;
    s = 10;
    for k = 1:iter/s
        addpoints(h,x((k-1)*s+1:k*s),y((k-1)*s+1:k*s),z((k-1)*s+1:k*s))
        drawnow 
    end
else
    ROT = 20;
    view(ROT,15)
    rotSpeed = 20;
    
    for j = 1:length(r)
        plot3(x(:,j),y(:,j),z(:,j),'k')
        axis vis3d equal
        axis([-30 30 -30 30 0 60])
        xticklabels([]);yticklabels([]);zticklabels([]);
        xticks([]);yticks([]);zticks([]);
        ROT = ROT+rotSpeed*.1; view(ROT,15);
        CAM = campos.*1.3;campos(CAM)
        drawnow
        r(j)
    end
end

