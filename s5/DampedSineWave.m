function f = DampedSineWave(tau, xi)
r = sqrt(1-xi^2);
phi = atan(r/xi);
f = exp(-xi*tau).*sin(tau*r+phi)/r;
end

