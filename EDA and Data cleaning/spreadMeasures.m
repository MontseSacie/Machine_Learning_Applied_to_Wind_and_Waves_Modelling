function [s] = spreadMeasures(data, year)
%Given a vector with data registers , we calculate the range of values
%the standard deviation, the variance and quartiles measures of it.
%INPUTS
    %data: vector wich collection of values from a variable
    %year: number of the year of which the data are from
%OUTPUTS 
    %y: struct with main spread measures values calculated, as atributes
    
%Author: Montserrat Sacie Alcázar
%-------------------------------------------------------------------------  
s.year = year;
s.range = range(data);
s.std = std(data); 
s.variance = var(data);
p = 0:0.25:1;
s.quantiles = quantile(data,p);
end

