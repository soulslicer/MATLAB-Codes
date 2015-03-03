% Q4

% 4.2.1 Establish Point Correspondences
load('cpstruct_building.mat');
button = questdlg('Load CPSELECT for building?');
if isequal(button,'Yes')
    cpselect('building1.jpg','building2.jpg',cpstruct);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4.2.2 - RMSD
x1 = cpstruct.inputPoints;
x2 = cpstruct.basePoints;

% Compute Mean
count = size(x1,1);
x1_mean = mean(x1);
x2_mean = mean(x2);

% Place mean in centre
x1_shifted = x1;
x2_shifted = x2;
for i = 1:count
    x1_shifted(i,:) = x1(i,:) - x1_mean;
end
for i = 1:count
    x2_shifted(i,:) = x2(i,:) - x2_mean;
end

% Make distance from origin to point root 2
x1_s = sqrt((sum(sum((x1_shifted.^2))))./(2*count));
x2_s = sqrt((sum(sum((x2_shifted.^2))))./(2*count));
x1_sinv = inv(x1_s);
x2_sinv = inv(x2_s);

% T Matrix as defined in paper
x1_T = [x1_sinv    0           -x1_sinv*x1_mean(1); ...
        0          x1_sinv     -x1_sinv*x1_mean(2); ...
        0          0           1                       ];
x2_T = [x2_sinv    0           -x2_sinv*x2_mean(1); ...
        0          x2_sinv     -x2_sinv*x2_mean(2); ...
        0          0           1                       ];
   
% Make into homogenous coordinates (Check this!)
x1_hom = [x1 ones(count,1)];
x2_hom = [x1 ones(count,1)];
x1_norm = (x1_T * x1_hom')';
x2_norm = (x2_T * x2_hom')';

% x1_norm = [x1 ones(count,1)] * x1_T';
% x2_norm = [x2 ones(count,1)] * x2_T';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create A matrix for Af=0
A = [];
for i = 1:count
    p1 = x1_norm(i,:); 
    p2 = x2_norm(i,:);
    A=[A; p2(1)*p1(1) p2(1)*p1(2) p2(1) p2(2)*p1(1) p2(2)*p1(2) p2(2) p1(1) p1(2) 1];
end

% Estimate F (RANK IS 6 HOW?)
rank(A)
[U,D,V] = svd(A);
F = [V(1,9) V(2,9) V(3,9) ; ...
     V(4,9) V(5,9) V(6,9) ; ...
     V(7,9) V(8,9) V(9,9)       ];
 
% Make Rank 2
[U,D,V] = svd(F);
D(3,3) = 0;
F = U * D * V';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4.2.4 Denormalize
F = x2_T' * F * x1_T;

img1 = imread('building1.jpg');
img2 = imread('building2.jpg');
figure(7), displayEpipolarF(img1,img2,F);
fprintf('Epipole visualization in figure 7\n');
