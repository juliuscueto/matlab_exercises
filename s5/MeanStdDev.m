function [m, s] = MeanStdDev(dat)
n = length(dat);
m = meen(dat, n);
s = stdev(dat, n);
end

function m = meen(v, n)
m = sum(v)/n;
end

function sd = stdev(v, n)
m = meen(v, n);
sd = sqrt((sum(v.^2)-n*m^2)/(n-1));
end
