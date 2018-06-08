a = 2; b = 5;
t = linspace(0,2*pi,11);
x = a*cos(t);
y = b*sin(t);
disp(['Area = ' num2str(polyarea(x, y))])