function debug(skel,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


%% scatter3(cluster10(:,1),cluster10(:,2),cluster10(:,3), 'MarkerFaceColor', [255/255 102/255 51/255])

figure(1);
for i=1:14
    hold on;

    %eval(sprintf('if(isempty(c%i)) continue; end;', i));
    string = sprintf('if(~isempty(c%i)) scatter3(c%i(:,1),c%i(:,2),c%i(:,3), \''MarkerFaceColor\'', [(%i+5)/30 (%i+5)/30 (%i+5)/30]);end', i,i,i,i,i,i,i);
    eval(string);
end

scatter3(skel(:,1), skel(:,2),skel(:,3),'x','g');

