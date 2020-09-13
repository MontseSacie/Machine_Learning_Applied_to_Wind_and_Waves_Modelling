function [DMeanp] = nearestNeighboursDistance(points,idxKneighbours,k)
%this function calculate for each point in "points", the mean
%distance from the point to each of its kneighbours (look kneighbours in "points" 
%by idxkNeighbours)
%INPUTS
    %points : data points
    %idxKneighbours: matrix with indexes of k nearest neighbours to each
                    %point in points
    %k = number of nearest neighbour considered
%OUTPUTS
    %DMeanp = nearest Neighbours mean distance for each point of points
%Author: Montserrat Sacie Alcázar
%--------------------------------------------------------------------------
DMeanp = zeros(size(idxKneighbours,1),1);
for i = 1:1:size(idxKneighbours,1)%para cada punto
    kneigh = points(idxKneighbours(i,:),:);
    [D] = euclideanDistance(repmat(points(i,:),k,1), kneigh);
    mOnes = ones(size(D,2));
    mOnes = mOnes(:,1);
    sum = mtimes(D,mOnes);
    DMeanp(i,1) = sum ./k;
end
end

