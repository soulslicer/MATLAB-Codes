A = importdata('final.txt');

Data = A(73,:);
Sonar_R = Data(3);
Sonar_Theta = Data(4);
Camera_X = Data(5);
Camera_Y = Data(6);
R_Sensor = Data(10);
P_Sensor = Data(11);
Y_Sensor = Data(12);

% Instrinsic
F=[5.510030525693059e+02,0,0;0,5.474333089969975e+02,0;3.827458119904111e+02,2.856771748162546e+02,1]';
F = [F [0 0 0]'];

% RPY Correction Matrix
P = P_Sensor; % Invert sign?
R = R_Sensor;
P = 0;
R = 0;
Y = 0;
Pitch = [	1       0           0       ; ...
            0       cosd(P)     -sind(P); ...
            0       sind(P)     cosd(P) ;	];
Yaw = [		cosd(Y) 	0       sind(Y)	; ...
            0           1       0       ; ...
            -sind(Y)	0       cosd(Y)	;	];	
Roll = [	cosd(R) 	-sind(R)    0	; ...
            sind(R)     cosd(R)     0 	; ...
            0           0           1	;	];
R = Pitch*Yaw*Roll;
R = [R [0 0 0]'];
R = [R; [0 0 0 1]];

% Camera to Sonar Translation
CS_Rotation = [	1 	0 	0	; ...
                0	1	0 	; ...
                0	0	1	;	];
CS_Translation = [0 0 0]';
CS_R = [CS_Rotation CS_Rotation*CS_Translation];
CS_R = [CS_R; [0 0 0 1]];

% 3D Space
RF = Sonar_R;
Theta = -1*Sonar_Theta;
Y = -3;
RR_Distance = sqrt((RF.^2) - Y);
% RR_Bounding = (RF.^2)/(1 + tan(15));
RR = min(RR_Distance, RR_Distance);
SPACE = [RR*sind(Theta) Y RR*cosd(Theta) 1]';

SPACE = [-2 0 10 1]';

% Final
pix = F*R*CS_R*SPACE;
ans = [pix(1)/pix(3) pix(2)/pix(3)]
