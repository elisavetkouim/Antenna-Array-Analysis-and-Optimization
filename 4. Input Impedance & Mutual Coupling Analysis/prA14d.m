Z0 = 50;
n = 120*pi;
lambda = 1;
k = 2*pi/lambda;
l = lambda/2;
D = 0:0.005:lambda;
H = 0:0.005:lambda;

[d, h] = meshgrid(D, H);


Rm = @(x) (n/(4*pi))*(2*cosint(k*x) - cosint(k*(sqrt(x.^2+l^2)+l)) - cosint(k*(sqrt(x.^2+l^2)-l)));
Xm = @(y) -(n/(4*pi))*(2*sinint(k*y) - sinint(k*(sqrt(y.^2+l^2)+l)) - sinint(k*(sqrt(y.^2+l^2)-l)));



Z11 = 73 + 1j*42;     % Z11=Z22=Z33
Zm_d = Rm(d) + 1j*Xm(d);  % Z12=Z23
Zm_2d = Rm(2*d) + 1j*Xm(2*d);  % Z13
Zm_2h = Rm(2*h) + 1j*Xm(2*h);  % Z14=Z25=Z36
Zm_2h_d = Rm(sqrt(4*h.^2+d.^2)) + 1j*Xm(sqrt(4*h.^2+d.^2));  % Z15=Z24=Z26=Z35
Zm_2h_2d = Rm(sqrt(4*h.^2+4*d.^2)) + 1j*Xm(sqrt(4*h.^2+4*d.^2));  % Z16=Z34

% ρευματα κανονικοποιημένα ως προς Ι2
I2 = 1;
I1 = -(Zm_d -Zm_2h_d) ./ (Z11 -Zm_2h +Zm_2d -Zm_2h_2d);  % I1=I3

Zin = I1*2.*(Zm_d -Zm_2h_d) + I2.*(Z11 -Zm_2h);
S11 = (Zin-Z0)./(Zin+Z0);
S11 = abs(S11);

idx = S11 < 0.3;
S11_03 = S11;
S11_03(idx) = -1;



surf(d, h, S11, S11_03);
shading interp;
colorbar;
colormap('parula')
xlabel('d/λ');
ylabel('h');
zlabel('|S_{11}|');
title('|S_{11}| συναρτήσει d (0≤d≤λ) και h (0≤h≤λ)');
