function [D] = euclideanDistance(X,Y)
%Calculate distance between each pair of points in X and Y (each row
%correspond to a point
%INPUTS
    %X = vector with points (numeric values)
    %Y = vector with points (numeric values)
%OUTPUT
    %D = vector with euclidean distance between each pair of X-Y points
%Author: Montserrat Sacie Alcázar
%------------------------------------------------------------------------
aux = X - Y;
aux = aux .^2
mOnes = ones(size(X,2));
mOnes = mOnes(:,1);
sum = mtimes(aux, mOnes);
D = sqrt(sum)';
end

