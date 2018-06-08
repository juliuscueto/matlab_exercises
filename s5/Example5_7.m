% Example of Cross-Correlation

T0 = 0.01; T1 = 2*T0; T2  = T1 + T0; Tend = T2+T0;
N = 2^10; deltaT = Tend/N; Ax = 1; Ay = 1;
t = linspace(0, Tend, N);
PulseCrossCorr = @(t, Ts, Te, ampl)(ampl*(((t-Ts)>=0)-((t-Te)>0)));
x = PulseCrossCorr(t, 0, T0, Ax);
y = PulseCrossCorr(t, T1, T2, Ay);
X = fft(x,N);
Y = conj(fft(y,N));
Rxy = ifft(X.*Y*deltaT,N);
plot(t, real(Rxy))