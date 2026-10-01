N_x = 24;
N_z = 12;
theta_max = pi/2;
phi_max = pi/6;

phi = phi_max + 0.000001;
phi_back = phi + pi;    % για το πίσω ημιεπίπεδο
theta = linspace(0, pi, 180);

% βρισκουμε τα delta_x και delta_y(psi_x=0, psi_z=0)
delta_x = - pi*cos(phi_max)*sin(theta_max);
delta_z = - pi*cos(theta_max);

psi_x = pi.*cos(phi).*sin(theta) + delta_x;
psi_x_back = pi.*cos(phi_back).*sin(theta) + delta_x;   % για το πίσω ημιεπίπεδο
psi_z = pi.*cos(theta) + delta_z;


A_x = abs( (sin ((N_x.*psi_x) / 2) ) ./ (sin ( psi_x / 2 )) );
A_x_back = abs( (sin ((N_x.*psi_x_back) / 2) ) ./ (sin ( psi_x_back / 2 )) );   % για το πίσω ημιεπίπεδο
A_z = abs( (sin ((N_z.*psi_z) / 2) ) ./ (sin ( psi_z / 2 )) );

E = A_x.*A_z;

E_back = A_x_back.*A_z;

clf;
polarplot(theta, E, 'b'); 
hold on;
polarplot(theta, E_back, 'r--');
legend('Μπροστά ημιεπίπεδο(φ=30)', 'Πίσω ημιεπίπεδο(φ=210)');
title('Κατακόρυφο διάγραμμα ακτινοβολίας για μέγιστο (θ=90, φ=30)');