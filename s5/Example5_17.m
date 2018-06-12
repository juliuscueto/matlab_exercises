function Example5_17
b = 1.5; gues(1:8) = 0.05;
solinit = bvpinit(linspace(0,1,20),gues);
beamsol = bvp4c(@BeamOverODEqo, @BeamOverBC, solinit, [], b);
eta = linspace(0,1,50);
y = deval(beamsol, eta);
eet = [eta eta*(b-1)+1];
for k = 1:4
    subplot(2,2,k)
    plot(eet, -[y(k,:) y(k+4,:)], 'k-')
    hold on
    plot([0 b], [0 0], 'k--')
end
end

function dydx = BeamOverODEqo(x,y,b)
dydx = [y(2);y(3);y(4);1;(b-1)*y(6);(b-1)*y(7);(b-1)*y(8);b-1];
end

function bc = BeamOverBC(yL,yR,b)
bc = [yL(1);yL(3);yR(1);yR(3)-yL(7);yL(5);yR(2)-yL(6);yR(7);yR(8)];
end