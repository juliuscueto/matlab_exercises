function Example5_12
Nt = 100; tzo = 15; z = 0.1; A = 0.85;
tau = linspace(0.1, 30, Nt);
yt = zeros(Nt,1);
for k = 1:Nt
    yt(k) = inq(tau(k), z, tzo);
    if tau(k) > tzo
        yt(k) = yt(k) - inq(tau(k)-tzo, z, tzo);
    end
end
plot(tau, yt, 'k-', [0, tzo, 30], [0,1,1], 'k--')
ri = interp1(yt, tau, A);
disp(['y(' num2str(ri,4) ')=' num2str(A)])
end

function a = arg(t, tau, z)
a = t.*exp(-z*(tau-t)).*sin(sqrt(1-z^2)*(tau-t));
end

function in = inq(tau, z, tzo)
in = quadl(@arg, 0, tau, [], [], tau, z)/sqrt(1-z^2)/tzo;
end