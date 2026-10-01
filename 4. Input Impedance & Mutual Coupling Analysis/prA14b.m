n = 120*pi;
lambda = 1;
k = 2*pi/lambda;
l = lambda/2;
d = [3*lambda/4, 3*lambda/2];   % 3*lambda/4 η απόσταση των (1)-(2), (2)-(3), 3*lambda/2 των (1)-(3)

u0 = k.*d;
u1 = k*(sqrt(d.^2+l^2)+l);
u2 = k*(sqrt(d.^2+l^2)-l);

Rm = (n/(4*pi))*(2*cosint(u0) - cosint(u1) - cosint(u2));
Xm = -(n/(4*pi))*(2*sinint(u0) - sinint(u1) - sinint(u2));


a = 73 + 1j*42;     % Z11=Z22=Z33
b = Rm(1) + 1j*Xm(1);   % Z12=Z21=Z23=Z32
c = Rm(2) + 1j*Xm(2);   % Z13=Z31

% ρευματα κανονικοποιημένα ως προς Ι2
I1 = -b/(a+c);   %I1=I3
I2 = 1;

Zin = a*I2 + 2*b*I1;

% διάγραμμα ακτινοβολίας
phi = linspace(0, 2*pi, 360);
theta = pi/2;

A = 1 + I1.*(exp(-1j*k*d(1).*cos(phi)*sin(theta)) + exp(1j*k*d(1).*cos(phi)*sin(theta)));

A = abs(A);
A = A/max(A);

polarplot(phi, A);
title('Οριζόντιο διάγραμμα ακτινοβολίας');


