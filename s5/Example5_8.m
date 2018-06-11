qcc = @(x,w)(cos(x).*cosh(x)-1);
x = linspace(0.1,20,50);
q = FindZeros(qcc,5,x,[]);
disp('Lowest five natural frequency coefficients are:')
disp(num2str(q'))