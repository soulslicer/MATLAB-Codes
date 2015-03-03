% (1.2)/(1.4s+1) e^-0.2s
A = 1.2;
tau = 1.4;
td = 0.2;
Gp = tf(A, [tau 1],'InputDelay', td);

% Graph it
[y,t] = step(Gp, 15);
figure(1),subplot(2,2,1), plot(t,y), grid, title('Step response of plant');

% Closed loop step
x=5.81;
Tend=10;
xh = 1.25.*x;
xl = 0.75.*x;

Kp = x;
Gol = series(Kp, Gp);
Gcl = feedback(Gol,1);
[y1,t1] = step(Gcl,Tend);
subplot(2,2,2),plot(t1,y1), grid, title('Step response of closed loop x');

Kp = xh;
Gol = series(Kp, Gp);
Gcl = feedback(Gol,1);
[y2,t2] = step(Gcl,Tend);
subplot(2,2,3),plot(t2,y2), grid, title('Step response of closed loop xh');

Kp = xl;
Gol = series(Kp, Gp);
Gcl = feedback(Gol,1);
[y3,t3] = step(Gcl,Tend);
subplot(2,2,4),plot(t3,y3), grid, title('Step response of closed loop xl');

% All in one
figure(2),plot(t1,y1,t2,y2,t3,y3),grid, title('Closed step response with P - control');