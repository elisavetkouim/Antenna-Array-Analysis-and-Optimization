I1 = solution.p(1);
I2 = solution.p(2);
I3 = solution.p(3);
I4 = solution.p(4);

I0 = 1;
N = 10;

I = [I0; I1; I2; I3; I4; I4; I3; I2; I1; I0];

lambda = 1;
d = lambda/2;
delta = 0;
k = 2*pi/lambda;
    
theta = linspace(0, pi/2, 360);
    
psi = k*d*cos(theta) + delta;
    
A = zeros(size(theta));
for n = 0:(N-1)
    A = A + I(n+1)*exp(1j*n*psi);
end

A = abs(A);
A = A / max(A);
A_dB = 20*log10(A);
A_dB(A_dB<-80) = -80;

    [peaks, locs] = findpeaks(A);
    peaks_dB = 20*log10(peaks);
    SLL_level_dB = -40;             %ΑΛΛΑΞΕ ΕΔΩ TA dB
    SLL_level = 10^(SLL_level_dB/20);
    S = mean((peaks-SLL_level).^2);


figure; 
plot(theta*180/pi, A_dB);
grid on;
title ('A dB Για βελτιστοποιημένα ρεύματα για ύψος πλευρικών λοβών κάτω από -40dB');   %ΑΛΛΑΞΕ ΕΔΩ ΤΑ dB