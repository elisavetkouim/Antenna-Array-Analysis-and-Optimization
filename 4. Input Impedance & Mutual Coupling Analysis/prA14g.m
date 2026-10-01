Z0 = 50;
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

a = 73 + 1j*42;     % Z11=Z22=Z33
b = Rm + 1j*Xm;   % Z12=Z21=Z23=Z32
c = Rm + 1j*Xm;   % Z13=Z31

% ρευματα κανονικοποιημένα ως προς Ι2
I1 = -b./(a+c);   %I1=I3
I2 = 1;

Zin = a*I2 + 2.*b.*I1;
S11 = (Zin-Z0)./(Zin+Z0);
S11 = abs(S11);

idx = find(S11 < 0.3);
d_03 = d(idx);
S11_03 = S11(idx);

figure;
plot(d, S11);
hold on;
plot(d_03, S11_03);
hold on;

    plot((d_03(1)), 0, 'ko', 'MarkerEdgeColor', 'none','MarkerFaceColor','r', 'MarkerSize',4);
    plot((d_03(1)), S11_03(1), 'ko', 'MarkerEdgeColor', 'none', 'MarkerFaceColor','r', 'MarkerSize',4);
    plot((d_03(length(d_03))), 0, 'ko', 'MarkerEdgeColor', 'none','MarkerFaceColor','r', 'MarkerSize',4);
    plot((d_03(length(d_03))), S11_03(length(d_03)), 'ko', 'MarkerEdgeColor', 'none', 'MarkerFaceColor','r', 'MarkerSize',4);
    text(d_03(1)-0.05, -0.1, sprintf('%.2f', d_03(1)), 'Color','r', 'HorizontalAlignment','left');
    text(d_03(length(d_03)), -0.1, sprintf('%.2f', d_03(length(d_03))), 'Color','r');
    plot(0, 0.3, 'ko', 'MarkerEdgeColor', 'none', 'MarkerFaceColor','r', 'MarkerSize',4);
    text(-0.1, 0.3, sprintf('0.3'), 'Color','r', 'HorizontalAlignment','left');

grid on;
title('Συντελεστής ανάκλασης στην είσοδο της κεραίας');
xlabel('d/λ');
ylabel('S_{11}');
legend('|S_{11}|', '|S_{11}|<0.3');