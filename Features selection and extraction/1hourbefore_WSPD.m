%Substitute 2018 for 2019 or RealTime to get the dataWind2019_st1 and
%dataWindRealTime_st1 data sets
%Author: Montserrat Sacie Alcázar
%---------------------------------------------------------------------------

dataWind2018_st1 = data2018;
dataWind2018_st1.WSPDt_1 = data2018.WSPD;
dataWind2018_st1.WSPD(1:end) = inf;
dataWind2018_st1.ATMPt_1 = data2018.ATMP;
dataWind2018_st1.PRESt_1 = data2018.PRES;
dataWind2018_st1.WSPD(1:end-1) = data2018.WSPD(2:end);
idxInfWspd = isinf(dataWind2018_st1.WSPD);
dataWind2018_st1(idxInfWspd,:) = [];