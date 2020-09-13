function [idxOutlier] = find_outliers(data)
%Function to obtain indexes of outliers in data table by the method of
%quartiles
%INPUTS
       %data : data set table
%OUTPUTS
       %idxOutlier: indexes of outliers
%Author: Montserrat Sacie Alcázar
%-------------------------------------------------------------------------
idxOutlier = isoutlier(data, 'quartiles');
end

