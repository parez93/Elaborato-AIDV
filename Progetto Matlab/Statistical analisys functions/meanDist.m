function [ distance ] = meanDist( cluster )
%% Author: Federico Parezzan, Francesco Fornasa
% This function calculates the mean distance between the points of a cluster and the skeleton
% distance = MEANDIST(cluster)
%  cluster = Nx4 matrix containig the points cloud of the cluster
%  distance = mean distance

distance = mean(cluster(:,4));

end

