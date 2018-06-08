function Example5_1
ncs = NeuberData;
c = polyfit(ncs(:,1), ncs(:,2), 4);
r = input('Enter notch radius (0<r<5mm): ');
Su = input('Enter ultimate strength of steel (0.3<Su<1.8GPa):');
q = 1/(1+polyval(c, Su)/sqrt(r));
disp(['Notch Sensitivity = ' num2str(q,3)])
end

function nd = NeuberData
nd = [0.34, 0.66;
      0.48, 0.46;
      0.62, 0.36;
      0.76, 0.29;
      0.90, 0.23;
      1.03, 0.19;
      1.17, 0.14;
      1.31, 0.10;
      1.45, 0.075;
      1.59, 0.050;
      1.72, 0.036];
end
