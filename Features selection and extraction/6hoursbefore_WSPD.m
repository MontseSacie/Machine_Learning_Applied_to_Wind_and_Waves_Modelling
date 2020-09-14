%Substitute 2018 for 2019 or RealTime to obtain dataWind2019_st6 and
%dataWindRealTime_st6 data sets
%Authors: Montserrat Sacie Alcázar
%-------------------------------------------------------------------------
dataWind2018_st6 = data2018;
dataWind2018_st6.WSPDt_6 = data2018.WSPD;
dataWind2018_st6.WSPDt_5 = data2018.WSPD;
dataWind2018_st6.WSPDt_4 = data2018.WSPD;
dataWind2018_st6.WSPDt_3 = data2018.WSPD;
dataWind2018_st6.WSPDt_2 = data2018.WSPD;
dataWind2018_st6.WSPDt_1 = data2018.WSPD;

dataWind2018_st6.WSPDt_6(1:end) = inf;
dataWind2018_st6.WSPDt_5(1:end) = inf;
dataWind2018_st6.WSPDt_4(1:end) = inf;
dataWind2018_st6.WSPDt_3(1:end) = inf;
dataWind2018_st6.WSPDt_2(1:end) = inf;
dataWind2018_st6.WSPDt_1(1:end) = inf;


dataWind2018_st6.WSPD(1:end-6) = data2018.WSPD(7:end);
dataWind2018_st6.WSPDt_1(1:end-5) = data2018.WSPD(6:end);
dataWind2018_st6.WSPDt_2(1:end-4) = data2018.WSPD(5:end);
dataWind2018_st6.WSPDt_3(1:end-3) = data2018.WSPD(4:end);
dataWind2018_st6.WSPDt_4(1:end-2) = data2018.WSPD(3:end);
dataWind2018_st6.WSPDt_5(1:end-1) = data2018.WSPD(2:end);
dataWind2018_st6.WSPDt_6(1:end) = data2018.WSPD(1:end);
%
idxInfWSPD = isinf(dataWind2018_st6.WSPD);
dataWind2018_st6(idxInfWSPD,:) = [];