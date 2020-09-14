%Substitute 2018 for 2019 or RealTime to obtain dataWind2019_st5 and
%dataWindRealTime_st5 data sets
%Authors: Montserrat Sacie Alcázar
%-------------------------------------------------------------------------
dataWind2018_st5 = data2018;

dataWind2018_st5.WSPDt_5 = data2018.WSPD;
dataWind2018_st5.WSPDt_4 = data2018.WSPD;
dataWind2018_st5.WSPDt_3 = data2018.WSPD;
dataWind2018_st5.WSPDt_2 = data2018.WSPD;
dataWind2018_st5.WSPDt_1 = data2018.WSPD;
%
dataWind2018_st5.ATMPt_1 = data2018.ATMP;
dataWind2018_st5.ATMPt_2 = data2018.ATMP;
dataWind2018_st5.ATMPt_3 = data2018.ATMP;
dataWind2018_st5.ATMPt_4 = data2018.ATMP;
dataWind2018_st5.ATMPt_5 = data2018.ATMP;

%
dataWind2018_st5.PRESt_1 = data2018.PRES;
dataWind2018_st5.PRESt_2 = data2018.PRES;
dataWind2018_st5.PRESt_3 = data2018.PRES;
dataWind2018_st5.PRESt_4 = data2018.PRES;
dataWind2018_st5.PRESt_5 = data2018.PRES;

%
dataWind2018_st5.WSPD(1:end) = inf;
dataWind2018_st5.WSPDt_5(1:end) = inf;
dataWind2018_st5.WSPDt_4(1:end) = inf;
dataWind2018_st5.WSPDt_3(1:end) = inf;
dataWind2018_st5.WSPDt_2(1:end) = inf;
dataWind2018_st5.WSPDt_1(1:end) = inf;
dataWind2018_st5.ATMPt_1(1:end) = inf;
dataWind2018_st5.ATMPt_2(1:end) = inf;
dataWind2018_st5.ATMPt_3(1:end) = inf;
dataWind2018_st5.ATMPt_4(1:end) = inf;
dataWind2018_st5.ATMPt_5(1:end) = inf;

%
dataWind2018_st5.PRESt_1(1:end) = inf;
dataWind2018_st5.PRESt_2(1:end) = inf;
dataWind2018_st5.PRESt_3(1:end) = inf;
dataWind2018_st5.PRESt_4(1:end) = inf;
dataWind2018_st5.PRESt_5(1:end) = inf;

%
dataWind2018_st5.WSPD(1:end-5) = data2018.WSPD(6:end);
dataWind2018_st5.WSPDt_1(1:end-4) = data2018.WSPD(5:end);
dataWind2018_st5.WSPDt_2(1:end-3) = data2018.WSPD(4:end);
dataWind2018_st5.WSPDt_3(1:end-2) = data2018.WSPD(3:end);
dataWind2018_st5.WSPDt_4(1:end-1) = data2018.WSPD(2:end);
dataWind2018_st5.WSPDt_5(1:end) = data2018.WSPD(1:end);

%
dataWind2018_st5.ATMP(1:end-5) = data2018.ATMP(6:end);
dataWind2018_st5.ATMPt_1(1:end-4) = data2018.ATMP(5:end);
dataWind2018_st5.ATMPt_2(1:end-3) = data2018.ATMP(4:end);
dataWind2018_st5.ATMPt_3(1:end-2) = data2018.ATMP(3:end);
dataWind2018_st5.ATMPt_4(1:end-1) = data2018.ATMP(2:end);
dataWind2018_st5.ATMPt_5(1:end) = data2018.ATMP(1:end);
%
dataWind2018_st5.PRES(1:end-5) = data2018.PRES(6:end);
dataWind2018_st5.PRESt_1(1:end-4) = data2018.PRES(5:end);
dataWind2018_st5.PRESt_2(1:end-3) = data2018.PRES(4:end);
dataWind2018_st5.PRESt_3(1:end-2) = data2018.PRES(3:end);
dataWind2018_st5.PRESt_4(1:end-1) = data2018.PRES(2:end);
dataWind2018_st5.PRESt_5(1:end) = data2018.PRES(1:end);

idxInfWspd = isinf(dataWind2018_st5.WSPD);
dataWind2018_st5(idxInfWspd,:) = [];