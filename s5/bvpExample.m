function bvpExample
k = 100;
solinit = bvpinit(linspace(0,1,5), [-0.05, 0.1]);
exmpsol = bvp4c(@OdeBvp, @OdeBC, solinit, [], k);
x = linspace(0,1,50);
y = deval(exmpsol,x);
plot(x,y(1,:))
end

function dydx = OdeBvp(x,y,k)
dydx = [y(2);x*k*y(1)];
end

function res = OdeBC(ya,yb,k)
res = [ya(1)-0.1;yb(1)-0.05];
end
