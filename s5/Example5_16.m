function Example5_16
qo = 1; Mr = 0.8;
solinit = bvpinit(linspace(0,1,10),[0.5,0.5,0.5,0.5]);
beamsol = bvp4c(@BeamODEqo,@BeamHingedBC,solinit,[],qo,Mr);
eta = linspace(0,1,50);
y = deval(beamsol, eta);
plot(eta,y(1,:))
end

function dydx = BeamODEqo(x,y,qo,Mr)
dydx = [y(2);y(3);y(4);qo];
end

function bc = BeamHingedBC(y0,y1,qo,Mr)
bc = [y0(1);y0(3);y1(1);y1(3)-Mr];
end