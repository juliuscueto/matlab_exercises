function ExampleFeval
NoRoots = 5; xStart = 0.2;
tolerance = 1e-6; increment = 0.3;
beta = pi/3; a = 0.5;
c = ManyZeros(@CosBeta, NoRoots, xStart, tolerance, increment, [beta,a])
end