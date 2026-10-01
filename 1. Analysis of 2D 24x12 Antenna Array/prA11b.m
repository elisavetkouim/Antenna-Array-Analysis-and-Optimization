N_x = 24;
N_z = 12;
theta_max = pi/3;
phi_max = pi/2;

phi = linspace(0, 2*pi, 360);
theta = linspace(0, pi, 180);
[phi, theta] = meshgrid(phi, theta);

% βρισκουμε τα delta_x και delta_y(psi_x=0, psi_z=0)
delta_x = - pi*cos(phi_max)*sin(theta_max);
delta_z = - pi*cos(theta_max);

psi_x = pi.*cos(phi).*sin(theta) + delta_x;
psi_z = pi.*cos(theta) + delta_z;


A_x = abs( (sin ((N_x.*psi_x) / 2) ) ./ (sin ( psi_x / 2 )) );
A_z = abs( (sin ((N_z.*psi_z) / 2) ) ./ (sin ( psi_z / 2 )) );

E = A_x.*A_z;

X = E.*cos(phi).*sin(theta);
Y = E.*sin(phi).*sin(theta);
Z = E.*cos(theta);

figure;
surf(X, Y, Z, E, 'EdgeColor','none');
title('3D διάγραμμα ακτινοβολίας για μέγιστο θ=60, φ=30');
colormap(jet);
colorbar;
axis equal;
lighting gouraud;
camlight headlight;
xlabel('X');
ylabel('Y');
zlabel('Z');