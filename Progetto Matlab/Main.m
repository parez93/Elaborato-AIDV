%% Author: Federico Parezzan, Francesco Fornasa
% This script is the main of the project. 
% For each model, dataCloudProcessing function is called  for calculating
% statistical information.
for i=1:10
    
    dataCloudProcessing(sprintf('./Dati/MODELS/%i.ply',i),sprintf('./Dati/SKEL/skeleton%i.ply',i),i);
    
end