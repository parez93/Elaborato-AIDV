function [ coordinate ] = centroid( cluster )
%% Author: Federico Parezzan, Francesco Fornasa
% This function calculates the coordinate of the centroid in a cluster
% coordinate = CENTROID(cluster)
%  cluster = Nx4 matrix containig the points cloud of the cluster
%  coordinate = 1x3 array containing the coordinates of the centroid

coordinate(1) = mean(cluster(:,1));
coordinate(2) = mean(cluster(:,2));
coordinate(3) = mean(cluster(:,3));

end
