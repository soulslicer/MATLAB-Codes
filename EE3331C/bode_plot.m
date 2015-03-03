% (1.2)/(1.4s+1) e^-0.2s
A = 1.2;
tau = 1.4;
td = 0.2;
Gp = tf(A, [tau 1],'InputDelay', td);

% Graph it
[y,t] = step(Gp, 15);
figure(1), plot(t,y), grid, title('Step response of plant');

% Bode plot for plant
[mag, php, w] = bode(Gp);
dbp = 20 * log10(mag);

x = 5.81;
xh = x.*1.5;

% Bode plot for series open loop
Kp = x;
[mag, phol1] = bode(series(Kp, Gp), w);
dbol1 = 20 * log10(mag);

Kp = xh;
[mag, phol2] = bode(series(Kp, Gp), w); 
dbol2 = 20 * log10(mag);

figure(3);
subplot(211), semilogx(w, dbp(:), w, dbol1(:), w, dbol2(:)), grid;
title('Open loop Bode (mag) plot with P ? Control'); legend('Plant',' gain = Kp',' gain > Kp');
subplot(212), semilogx(w, php(:), w, phol1(:), w, phol2(:)), grid; title('Open loop Bode (phase) plot with P ? Control'); legend('Plant',' gain = Kp',' gain > Kp');

% Bode plot for series feedback
Kp = x;
[mag, phcl1] = bode(feedback(series(Kp, Gp), 1), w);
dbcl1 = 20 * log10(mag);

Kp = xh;
[mag, phcl2] = bode(feedback(series(Kp, Gp), 1), w); 
dbcl2 = 20 * log10(mag);

figure(4);
subplot(211), semilogx(w, dbcl1(:), w, dbcl2(:)), grid; title('Closed loop Bode (mag) plot with P ? Control'); legend('gain = Kp',' gain > Kp');
subplot(212), semilogx(w, phcl1(:), w, phcl2(:)), grid; title('Closed loop Bode (phase) plot with P ? Control'); legend('gain = Kp',' gain > Kp');

