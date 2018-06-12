function Example5_18
e=0.005; etao = 0.5;
pts=[linspace(0,etao-2*e,4),etao-e,etao,etao+e,linspace(etao+2*e,1,4)];
solinit = bvpinit(pts,[0.5,0.5,0.5,0.5]);
beamsol = bvp4c(@BeamPointODEqo, @BeamPointHingedBC, solinit, [], etao, e);
eta = linspace(0,1,100);
y = deval(beamsol, eta);
for k = 1:4
    subplot(2,2,k)
    plot(eta,y(k,:),'k-')
    hold on
    plot([0 1], [0 0], 'k--')
end    
end

function dydx = BeamPointODEqo(x,y,etao,e)
q = ((x>etao-e)&(x<etao+e))/(2*e);
dydx = [y(2);y(3);y(4);q];
end

function bc = BeamPointHingedBC(yL,yR,etao,e)
bc = [yL(1);yL(3);yR(1);yR(3)];
end