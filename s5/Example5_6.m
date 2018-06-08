% Example of fft
k = 5; m = 10; fo = 10; Bo = 2.5;
N = 2^m; T = 2^k/fo;
ts = (0:N-1)*T/N;
df = (0:N/2-1)/T;
whamm = 0.54 - 0.46*cos(2*pi*ts/T);
SampledSignal = Bo*sin(2*pi*fo*ts);
k1 = sum(whamm.*SampledSignal)/sum(whamm);
k2 = sqrt(N/sum(whamm.^2));
CorrectedSignal = whamm.*(SampledSignal - k1)*k2;
figure(1)
plot(ts, CorrectedSignal)
figure(2)
An = abs(fft(CorrectedSignal, N))/N;
plot(df, 2*An(1:N/2))
disp(['Average Power = ' num2str(sum(An.^2))])