function debug2( cluster, x, y, z)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


%% scatter3(cluster10(:,1),cluster10(:,2),cluster10(:,3), 'MarkerFaceColor', [255/255 102/255 51/255])


scatter3(x,y,z,'b');
hold on;
scatter3(cluster(:,1),cluster(:,2),cluster(:,3),'r');
