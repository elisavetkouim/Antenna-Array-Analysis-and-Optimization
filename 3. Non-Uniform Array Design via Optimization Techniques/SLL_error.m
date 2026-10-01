function S = SLL_error(p)

    I1 = p(1);
    I2 = p(2);
    I3 = p(3);
    I4 = p(4);

    I0 = 1;
    N = 10;

    I = [I0; I1; I2; I3; I4; I4; I3; I2; I1; I0];

    lambda = 1;
    d = lambda/2;
    delta = 0;
    k = 2*pi/lambda;
    SLL_level_dB = -40;        %ΑΛΛΑΞΕ ΕΔΩ TA dB
    SLL_level = 10^(SLL_level_dB/20);
    
    theta = linspace(0, pi/2, 90);
    psi = k*d*cos(theta) + delta;
    
    A = zeros(size(theta));
    for n = 0:(N-1)
        A = A + I(n+1)*exp(1j*n*psi);
    end

    A = abs(A);
    A = A / max(A);
    
    [peaks, locs] = findpeaks(A);
   
    S = mean((peaks-SLL_level).^2);

end