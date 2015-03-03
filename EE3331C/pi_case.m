% (1.2)/(1.4s+1) e^-0.2s
A = 1.2;
tau = 1.4;
td = 0.2;
Gp = tf(A, [tau 1],'InputDelay', td);
[mag, php, w] = bode(Gp);
dbp = 20 * log10(mag);

% PI Controller
Kp = 5.23;
Ti = 0.66;
C=Kp*tf([Ti 1],[Ti 0]); 
Gol = series(C, Gp);
Gcl = feedback(Gol, 1); 
[y4, t4] = step(Gcl, 10);

Kp = 1.5.*Kp;
C=Kp*tf([Ti 1],[Ti 0]); 
Gol = series(C, Gp);
Gcl = feedback(Gol, 1); 
[y5, t5] = step(Gcl, 10);

figure(5), plot(t4, y4, t5, y5), grid;

% Generate open loop
% Bode plot for series open loop
% PI Controller
Kp = 5.23;
Ti = 0.66;
C=Kp*tf([Ti 1],[Ti 0]); 
Gol = series(C, Gp);

Kp = 5.23;
Ti = 0.66;
[mag, phol1] = bode(Gol, w);
dbol1 = 20 * log10(mag);

figure(6);
subplot(211), semilogx(w, dbp(:), w, dbol1(:)), grid;
title('Open Loop PI Magnitude DB'); legend('Plant',' Open Loop');
subplot(212), semilogx(w, php(:), w, phol1(:)), grid; 
title('Open Loop PI Phase'); legend('Plant',' Open Loop');

