n = 120*pi;
lambda = 1;
k = 2*pi/lambda;
l = lambda/2;
d1 = 3*lambda;
d = 0:0.001:d1;

u0 = k.*d;
u1 = k*(sqrt(d.^2+l^2)+l);
u2 = k*(sqrt(d.^2+l^2)-l);

Rm = (n/(4*pi))*(2*cosint(u0) - cosint(u1) - cosint(u2));
Xm = -(n/(4*pi))*(2*sinint(u0) - sinint(u1) - sinint(u2));

figure;
plot(d, Rm);
hold on;
plot(d, Xm);
grid on;
legend('R_{m}', 'X_{m}');
title('Αμοιβαία αντίσταση 2 παράλληλων διπόλων λ/2');
xlabel('d/λ');
ylabel('Z_{21m} (Ω)')
