function [data, idx] = cleaning(data, historical)
%CLEANING This function delete missing values (999) from input data set and
%return the clean data set.
%INPUTS
    %data : metocean data set
    %historical: boolean equal to 1 if data corresponds to a historical
    %file data or 0 other wise
%OUTPUTS
    %data: clean data set
    %idx: indixes of the rows containing missing values
%Author: Montserrat Sacie Alcázar
%%-------------------------------------------------------------------------
if historical
    idx =  zeros(length(data.WDIR),10);
    idx(:,1) = data.WDIR >= 999;
    idx(:,2) = data.WSPD >= 99;
    idx(:,3) = data.GST >= 99;
    idx(:,4) =  data.WVHT >= 99;
    idx(:,5) = data.DPD >= 99;
    idx(:,6) = data.APD>= 99;
    idx(:,7) = data.MWD >= 999;
    idx(:,8) = data.PRES >= 9.999999999999999e+03;
    idx(:,9) = data.ATMP >= 99;
    idx(:,10) = data.WTMP >= 99;
    
    idxNaN = (data.WDIR >= 999 | data.WSPD >= 99 | data.GST >= 99 | ...
        data.WVHT >= 99 | data.DPD >= 99 | data.APD>= 99 | ...
        data.MWD >= 999 | data.PRES >= 9.999999999999999e+03 | ...
        data.ATMP >= 99 | data.WTMP >= 99); 
    data(idxNaN, :) = []; 
else %Real time data
    idx = isnan(table2array(data(:,1:end-1)));
    data(any(idx,2),:) = [];
    %After reading data MM has been replaced by NaN. If not, uncomment
    %the following lines 
    %id = 'MM';
    %data = standardizeMissing(data, id);
    %idxMM = ismissing(data);
    %windRealData(idxMM, :) = []; %missing value
    %windRealData.WDIR = str2double(windRealData.WVHT);
end
end