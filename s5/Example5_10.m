Atop = @(x)(x+2);
Abot = @(x)(x.^2);
Area = quadl(Atop, -1, 2) - quadl(Abot, -1, 2);
Mxc = @(x)(x.*((x+2)-x.^2));
Myc = @(x)(((x+2).^2-x.^4)/2);
xc = quadl(Mxc, -1, 2)/Area
yc = quadl(Myc, -1, 2)/Area