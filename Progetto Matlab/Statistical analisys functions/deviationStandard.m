function [ stDev ] = deviationStandard( cluster )
%% Author: Federico Parezzan, Francesco Fornasa
% This function calculates the deviation standard of the distance between the points of a cluster and the skeleton
% stDev = DEVIATIONSTANDARD(cluster)
%  cluster = Nx4 matrix containig the points cloud of the cluster
%  stDev = standard deviation

stDev = std(cluster(:,4));

end

