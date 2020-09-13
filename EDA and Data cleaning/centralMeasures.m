function [y] = centralMeasures(data, year)
%Given a vector with data registers , we calculate the mean, median and
%mode measures of it.
%INPUTS
    %data: vector wich collection of values from a variable
    %year: number of the year of which the data are from
%OUTPUTS 
    %y: struct with main central measures values calculated, as atributes

%Author: Montserrat Sacie Alcázar
%-------------------------------------------------------------------------
y.year = year;
y.mean = mean(data,'omitnan');
y.median = median(data,'omitnan'); 
y.mode = mode(data);

end

