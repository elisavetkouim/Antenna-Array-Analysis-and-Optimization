N_x = 24;
N_z = 12;
theta_max = pi/2;
phi_max = 0;

phi = linspace(0.0001, 2*pi, 360);
theta = linspace(0.00001, pi, 180);
[Phi, Theta] = meshgrid(phi, theta);

% βρισκουμε τα delta_x και delta_y(psi_x=0, psi_z=0)
delta_x = - pi*cos(phi_max)*sin(theta_max);
delta_z = -pi*cos(theta_max);

psi_x = pi.*cos(Phi).*sin(Theta) + delta_x;
psi_z = pi.*cos(Theta) + delta_z;


A_x = abs( (sin ((N_x.*psi_x) / 2) ) ./ (sin ( psi_x / 2 )) );
A_z = abs( (sin ((N_z.*psi_z) / 2) ) ./ (sin ( psi_z / 2 )) );
A_xz = A_x.*A_z;

S = 0;

dtheta = theta(2)-theta(1);
dphi = phi(2)-phi(1);
for n = 1:360
    for m = 1:180
        S = S + (A_xz(m,n))^2  * sin(Theta(m,n)) *dtheta*dphi;
    end
end

D = (4*pi*(N_x*N_z)^2) / S ;
D_db = 10*log10(D);