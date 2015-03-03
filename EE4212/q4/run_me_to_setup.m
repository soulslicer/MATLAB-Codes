close all; clear all; clc;

addpath(genpath(pwd())); savepath;

% Do all the compilation things
% Make sure your matlab is already associated with an installed C/C++
% compiler. If you have not done it, you can just type the following
% command
%       mex -setup
% and then follow the instructions. Usually the default choices will work.
toolboxSfmCompile();

