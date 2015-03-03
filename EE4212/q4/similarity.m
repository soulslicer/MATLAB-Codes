function [T] = similarity(x)
%Computes the similarity transformation T of x
%
%   T is a 3 x 3 matrix, and x is n x 2 matrix
%   xT' returns the n x 3 transformed homogeneous coordinates, where x is
%   the n x 3 homogeneous input coordinates
    
    x_mean = mean(x);
    x_dim = size(x);

    % Centering at (0,0)
    for i = 1:x_dim(1)
        x(i,:) = x(i,:) - x_mean;
    end

    % Derive scaling factor to ensure average RMS is sqrt(2)
    x_scale = x_dim(1)*sqrt(2)/sum(sqrt(sum((x').*(x'))));

    T = [x_scale    0           -x_scale*x_mean(1); ...
         0          x_scale     -x_scale*x_mean(2); ...
         0          0           1                       ];
