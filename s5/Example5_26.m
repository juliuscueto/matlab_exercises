syms t xi n r a
r = sqrt(1-xi^2);
arg = exp(xi*n)*sin(r*(t-n));
yt = exp(-xi*t)*int(arg,n,0,t)/r;
yoft = matlabFunction(yt,'vars',[t, xi]);
tt = linspace(0,20,200);
z = 0.15;
plot(tt,yoft(tt,z))
