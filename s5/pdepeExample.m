function pdepeExample
Bi = 0.1; T1 = 0.55; Sigma = 1;
xi = linspace(0,1,25); tau = linspace(0,1,101);
theta = pdepe(0 ,@pde1D, @pdeIC, @pdeBC, xi, tau, [], Bi, T1, Sigma);
hold on
for kk = 1:5:length(xi)
    plot(tau, theta(:,kk),'k-')
end
end

function [c,f,s] = pde1D(x,t,u,DuDx,Bi,Tr,Sigma)
c = 1; f = DuDx; s = Sigma;
end

function T0 = pdeIC(x,Bi,Tr,Sigma)
T0 = 1 - 0.45*x;
end

function [pl,ql,pr,qr] = pdeBC(xl,ul,xr,ur,t,Bi,Tr,Sigma)
pr = ur - Tr; qr = 0; pl = -Bi*ul; ql=1;
end