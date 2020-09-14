%Substitute 2018 for 2019 or RealTime to obtain dataWind2019_st2 and
%dataWindRealTime_st2 data sets
%Author: Montserrat Sacie Alcázar
%--------------------------------------------------------------------------
dataWind2018_st2 = data2018;

dataWind2018_st2.WSPDt_2 = data2018.WSPD;
dataWind2018_st2.WSPDt_1 = data2018.WSPD;
%
dataWind2018_st2.ATMPt_1 = data2018.ATMP;
dataWind2018_st2.ATMPt_2 = data2018.ATMP;
%
dataWind2018_st2.PRESt_1 = data2018.PRES;
dataWind2018_st2.PRESt_2 = data2018.PRES;
%
dataWind2018_st2.WSPD(1:end) = inf;
dataWind2018_st2.WSPDt_2(1:end) = inf;
dataWind2018_st2.WSPDt_1(1:end) = inf;
dataWind2018_st2.ATMPt_1(1:end) = inf;
dataWind2018_st2.ATMPt_2(1:end) = inf;
%
dataWind2018_st2.PRESt_1(1:end) = inf;
dataWind2018_st2.PRESt_2(1:end) = inf;

dataWind2018_st2.WSPD(1:end-2) = data2018.WSPD(3:end);
dataWind2018_st2.WSPDt_1(1:end-1) = data2018.WSPD(2:end);
dataWind2018_st2.WSPDt_2(1:end) = data2018.WSPD(1:end);
%
dataWind2018_st2.ATMP(1:end-2) = data2018.ATMP(3:end);
dataWind2018_st2.ATMPt_1(1:end-1) = data2018.ATMP(2:end);
dataWind2018_st2.ATMPt_2(1:end) = data2018.ATMP(1:end);

%
dataWind2018_st2.PRES(1:end-2) = data2018.PRES(3:end);
dataWind2018_st2.PRESt_1(1:end-1) = data2018.PRES(2:end);
dataWind2018_st2.PRESt_2(1:end) = data2018.PRES(1:end);

idxInfWspd = isinf(dataWind2018_st2.WSPD);
dataWind2018_st2(idxInfWspd,:) = [];