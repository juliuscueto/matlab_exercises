function Example5_20
Omguess = 4.0;
solinit = bvpinit(linspace(0,1,6),@EulerBeamInit,Omguess);
beamsol = bvp4c(@EulerBeamODE,@EulerBeamBC,solinit);
Omega = beamsol.parameters;
eta = linspace(0,1,50);
y = deval(beamsol,eta);
ModeShape = y(1,:)/max(abs(y(1,:)));
disp([' Omega/pi = ' num2str(Omega/pi,6)])
end

function yinit = EulerBeamInit(x)
yinit = [sin(pi*x);cos(pi*x);-sin(pi*x);-cos(pi*x)];
end

function bc = EulerBeamBC(w0,w1,Om)
bc = [w0(1);w0(4)-0.05; w0(2);w1(1);w1(2)];
end

function dydx = EulerBeamODE(x,w,Om)
dydx = [w(2);w(3);w(4);Om^4*w(1)];
end