function ExampleODE
[t, yy] = ode45(@HalfSine, [0 35], [1 0], [], 0.15);
plot(t, yy(:,1))
end

function y = HalfSine(t, y, z)
h = sin(pi*t/5).*(t<=5);
y = [y(2); -2*z*y(2)-y(1)+h];
end

