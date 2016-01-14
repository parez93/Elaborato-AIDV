function dataCloudProcessing( pathPointsCloud, pathSkeleton, countIndex )
%% Author: Federico Parezzan, Francesco Fornasa
%%This function is used to fully clusterize the input point cloud
% according to the input skeleton point cloud
% INPUTS : pathPointsCloud = the path to the point cloud .ply file
%		 : pathSkeleton = the path to the .ply file for the skeleton points
%        : countIndex = the index of the .ply file read

% Reads the points cloud in ply format and saves them in 3 variables


%% Read the points cloud in ply format
pointCloud = plyread(pathPointsCloud);

x = pointCloud.vertex.x;
y = pointCloud.vertex.y;
z = pointCloud.vertex.z;

%% Read the skeleton
skeletonPoints = plyread(pathSkeleton);
skeletonPoints = [skeletonPoints.vertex.x, skeletonPoints.vertex.y,skeletonPoints.vertex.z];



%% Create the clusters matrix: each row has 2 points [ (x1 y1 z1) (x2 y2 z2) ]
%1 testa - collo
%2 collo - spalla sinistra
%3 collo - spalla destra
%4 spalla sinistra - gomito sinistro
%5 gomito sinistro - mano sinistra
%6 spalla destra - gomito destro
%7 gomito destro - mano destra
%8 collo - torso
%9 torso - anca sinistra
%10 anca sinistra - ginocchio sinistro
%11 ginocchio sinistro - piede sinistro
%12 torso - anca destra
%13 anca destra - ginocchio destro
%14 ginocchio destro - piede destra

head = skeletonPoints(1,:);
neck = skeletonPoints(2,:);
lshoulder = skeletonPoints(3,:);
lelbow = skeletonPoints(4,:);
lhand = skeletonPoints(5,:);
rshoulder = skeletonPoints(6,:);
relbow = skeletonPoints(7,:);
rhand = skeletonPoints(8,:);
torso = skeletonPoints(9,:);
lhip = skeletonPoints(10,:);
lknee = skeletonPoints(11,:);
lfoot = skeletonPoints(12,:);
rhip = skeletonPoints(13,:);
rknee = skeletonPoints(14,:);
rfoot = skeletonPoints(15,:);

cluster = [head neck
    neck lshoulder
    neck rshoulder
    lshoulder lelbow
    lelbow lhand
    rshoulder relbow
    relbow rhand
    neck torso
    torso lhip
    lhip lknee
    lknee lfoot
    torso rhip
    rhip rknee
    rknee rfoot];


    cluster1 = [];
    cluster2 = [];
    cluster3 = [];
    cluster4 = [];
    cluster5 = [];
    cluster6 = [];
    cluster7 = [];
    cluster8 = [];
    cluster9 = [];
    cluster10 = [];
    cluster11 = [];
    cluster12 = [];
    cluster13 = [];
    cluster14 = [];
 



for punto = 1:size(x)
    distanze = [];
    
    for dist = 1:14
        distanze(dist) = project_point_to_line_segment(cluster(dist,4:6)', cluster(dist,1:3)', [x(punto);y(punto);z(punto)] );%abs(cross(cluster(dist,4:6)' - cluster(dist,1:3)', [x(punto);y(punto);z(punto)] - cluster(dist,1:3)'))/abs(cluster(dist,4:6)' - cluster(dist,1:3)');
    end
    index = find(distanze == min(distanze));
    
    string = sprintf('cluster%i = [cluster%i; [x(punto), y(punto), z(punto), distanze(%i)]];', index(1), index(1), index(1));
    eval(string);
end

centroide =[];
deviazione_standard =[];
distanza_media=[];
deviazione_standard=[];

%% Calculating main statistical informations
for i=1:14
   cluster_is = sprintf('cluster%i', i);
   cluster_i = eval(cluster_is);
   centroide = [centroide ;centroid(cluster_i)];
   deviazione_standard = [deviazione_standard ; deviationStandard(cluster_i)];
   distanza_media = [distanza_media; meanDist(cluster_i)];

   
end

csvwrite_with_headers(sprintf('./OUTPUT/%i.csv',countIndex),[centroide(:,1),centroide(:,2),centroide(:,3), distanza_media, deviazione_standard],{'x of centroid','y of centroid','z of centroid','mean distance','distance stddev'});
