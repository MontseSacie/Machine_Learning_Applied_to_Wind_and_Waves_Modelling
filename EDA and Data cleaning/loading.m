function [data] = loading(fileName, historical, year)
%LOADING data from a txt file (downloaded from webpage) into a table
%INPUTS
    %fileName: name of file (with extension .txt included) that contains
                %data
    %historical: boolean equal to 1 if the the file to read data is
                %historical or 0(Real Time data file)
    %year: the year of data we want to read
% OUTPUTS
    %data: table with data read from webpage of NOAA
%Author: Montserrat Sacie Alcázar
%--------------------------------------------------------------------------

if (historical && ~isempty(fileName))
    url = strcat('https://www.ndbc.noaa.gov/view_text_file.php?filename=46011h',...
                  year,'.txt.gz&dir=data/historical/stdmet/');
    fileNamePath = websave(fileName, url);
    data = readtable(fileNamePath, 'ReadVariableNames',true);
    data.Properties.VariableNames{1} = 'YY';
    data.Properties.VariableUnits = {'yr',  'mo', 'dy', 'hr', 'mn', 'degT',...
                                     'm/s',  'm/s', 'm', 'sec', 'sec', 'degT'...
                                     'hPa',  'degC',  'degC', 'degC', 'mi','ft'};
elseif ~isempty(fileName)
    url = 'https://www.ndbc.noaa.gov/data/realtime2/46011.txt';
    fileNamePath = websave(fileName, url);
    data = readtable(fileNamePath, 'ReadVariableNames',true, 'TreatAsMissing', 'MM');
    data.Properties.VariableNames{1} = 'YY';
    data.Properties.VariableUnits = {'yr',  'mo', 'dy', 'hr', 'mn', 'degT',...
                                 'm/s',  'm/s', 'm', 'sec', 'sec', 'degT'...
                                 'hPa',  'degC',  'degC', 'degC', 'mi','hPa',...
                                 'ft'};
end
end