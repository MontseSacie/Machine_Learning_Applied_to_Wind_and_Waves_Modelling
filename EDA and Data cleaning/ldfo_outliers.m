function [LDFO, D150,Idx150, knnInnerDistance]=  ldfo_outliers(data)
%This method calculate the coefficient LDFO for every point in data set
%INPUTS
    %data : data set table
%OUTPUTS
    %LDFO : vector with LDFO coefficient for each data example (observation)
    %D150 : 150 nearest neighbours for each point
    %Idx150: indexes of 150 nearest neighbouts for each point
    %knnInnerDistance: knnInnerDistance for each point
%Author: Montserrat Sacie Alcázar
%--------------------------------------------------------------------------
%Create the model by training with the data set: data
Mdl =  ExhaustiveSearcher(data);

%Find 150 nearest neighbour for each point (k = 150)
k = 150;

Idx150 = knnsearch(Mdl, data, 'K',k);
D150 = nearestNeighboursDistance(data, Idx150,k); %para cada punto

%Calculate the k-inner distance for each point
knnInnerDistance = zeros(size(Idx150,1),1)
for p = 1:size(Idx150,1)
    %Distance for all posible pair-points between k neighbours for
    %register p
    kpoints = data(Idx150(p,:),:)
    idxM = combnk(1:size(kpoints,1),2);
    D = euclideanDistance(kpoints(idxM(:,1),:),kpoints(idxM(:,2),:))
    knnInnerDistance(p,1) =  1/(k*(k-1)) * sum(D)
end
%Calculate the LDFO coefficient
LDFO = D150./ knnInnerDistance;
save('resultado.mat')
end