function Example5_15
mr = 0.05; zx = 0.05; zt=0.005;
Om = 1; wr = 0.5; fo = 0.03;
[t, w] = ode45(@PendulumAbsorber, [0 300], [0 0 0.02 0], [], mr, zx, zt, Om, wr, fo);
plot(t,w(:,3))
end

function Q = PendulumAbsorber(t, w,  mr, zx, zt, Om, wr, fo)
A = fo*cos(Om*t)-w(1)-2*zx*w(2)-mr*w(4)^2*cos(w(3));
B = -2*zt*w(4)-wr^2*sin(w(3));
x4dot = (B-A*sin(w(3)))/(1-mr*sin(w(3))^2);
x2dot = (A-mr*B*sin(w(3)))/(1-mr*sin(w(3))^2);
Q = [w(2); x2dot; w(4); x4dot];
end