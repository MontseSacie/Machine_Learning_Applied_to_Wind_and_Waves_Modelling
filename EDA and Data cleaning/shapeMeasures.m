function [a] = spreadlMeasures(data, year)
%Given a vector with data registers , we calculate the central moment,
%maximum and minimum measures of it.
%INPUTS
    %data: vector wich collection of values from a variable
    %year: number of the year of which the data are from
%OUTPUTS 
    %y: struct with main spread measures values calculated, as atributes

%Author: Montserrat Sacie Alcázar
%------------------------------------------------------------------------- 
a.year = year;
a.centralMoment = moment(data, 3); %momentum-order3
a.maximun = max(data);
a.minimun = min(data);
end


