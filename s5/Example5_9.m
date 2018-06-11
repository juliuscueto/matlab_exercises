suma = @(a)(sum(1./([1:1000].^2-a)));
fofa = fzero(suma, pi/2);
disp(['The value of a is ' num2str(fofa)])