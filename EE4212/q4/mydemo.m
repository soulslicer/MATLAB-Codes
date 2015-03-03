close all; clear all; clc;

addpath(genpath(pwd()));

disp('Rigid SFM example with two uncalibrated projective cameras.');

% Testing data x1 and x2: 50 correspondences from two images
load misc/test_data.mat;

% Correspondences have to be packed into a 2xnx2 matrix before being fed
% into computeSMFromW().
samples = zeros(2,size(x1,2),2);
samples(:,:,1) = x1;
samples(:,:,2) = x2;

%% 3D reconstruction

% Compute the reconstruction using the package. your estimateF() will be a
% callback function inside this part.

anim = computeSMFromW(true, samples);


%% Below is for visualization

% Decompose the camera projection matrices to update. If you do not call
% this function, only reconstructed 3D points without cameras will be
% visualized.
anim = updateAnimation(anim);

% Display reconstruction results (3D points and cameras). You might need to
% zoom in to see the cameras clearly
figure;
playAnim( anim, 'frame', 1, 'nCam', 2 );

