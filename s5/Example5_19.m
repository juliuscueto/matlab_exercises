function Example5_19
b = 0.7; alpha = 4;
guess(1:8) = 0.05;
solinit = bvpinit(linspace(0,b,5),guess);
beamsol = bvp4c(@BeamStepODEqo, @BeamStepBC, solinit, [], b, alpha);
eta = linspace(0,b,50);
y = deval(beamsol, eta);
for k = 1:4
    subplot(2,2,k)
    plot([eta (1-b)*b*eta+b],-[y(k,:) y(k+4,:)],'k-')
    hold on
    plot([0 1],[0 0],'k--')
end
end

function dydx = BeamStepODEqo(x,y,b,alpha)
c = (1-b)/b;
dydx = [y(2);y(3);y(4);1;c*y(6);c*y(7);c*y(8);c*alpha];
end

function bc = BeamStepBC(yL,yR,b,alpha)
bc = [yL(1);yL(3);yR(1)-yL(5);yR(3)-yL(7);yR(2)-yL(6);yR(4)-yL(8);yR(5);yR(7)];
end