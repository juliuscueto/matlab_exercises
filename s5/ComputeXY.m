function [x,y] = ComputeXY(t)
%COMPUTEXY Example Function
%Computation of -
% x = cos(ax) + b
% y = |x| + c
% Scalars: a, b, c
% Vectors: t, x, y
global A B C
x = cos(A*t) + B;
y = abs(x) + C;
end

