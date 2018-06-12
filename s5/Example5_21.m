function Example5_21
Om = 0.225; Q = 20; mu = 1; Kk = 0.0029; k1k = 0.0785;
A = 1/Q+Kk/Om; B = 1+k1k; C = mu*k1k;
sol = dde23(@ChatterODE,1/Om,[0.1;0.1],[0,300],[],A,B,C);
tau = linspace(0,300,700);
y = deval(sol,tau);
plot(tau,y(1,:),'k-')
end

function der = ChatterODE(t,y,Z,A,B,C)
ylag1 = Z(:,1);
der = [y(2);-A*y(2)-B*y(1)+C*ylag1(1)];
end