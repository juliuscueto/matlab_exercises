function nRoots = ManyZeros(zname, n, xs, toler, dxx, w)
x = xs;
dx = dxx;
nRoots = zeros(n,1);
for m = 1:n
    s1 = sign(feval(zname, x, w));
    while dx/x > toler
        if s1 ~= sign(feval(zname, x+dx, w))
            dx = dx/2;
        else
            x = x+dx;
        end
    end
    nRoots(m) = x;
    dx = dxx;
    x = 1.05*x;
end

