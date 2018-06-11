function Example5_14
y0 = [0,0,0.68,1,-0.50];
Pr = 0.7;
[eta, ff] = ode45(@NaturalConv, [0 5], y0, [], Pr);
subplot(2,1,1)
plot(eta, ff(:,1), '-.k', eta, ff(:,2), '-k', eta, ff(:,3), '--k')
subplot(2,1,2)
plot(eta, ff(:,4), '-k', eta, ff(:,5), '--k')
end

function ff = NaturalConv(x, y, Pr)
ff = [y(2);y(3);-3*y(1)*y(3)+2*y(2)^2-y(4);y(5);-3*Pr*y(1)*y(5)];
end

