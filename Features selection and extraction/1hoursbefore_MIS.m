%%Substitute 2018 for 2019 or RealTime to obtain dataMis2019_st1 and
%dataMisRealTime_st1 data sets
%Authors: Montserrat Sacie Alcázar
%-------------------------------------------------------------------------
dataMis2018_st1 = data2018;
dataMis2018_st1.WTMP_t1  = data2018.WTMP;
dataMis2018_st1.APD_t1  = data2018.APD;
dataMis2018_st1.PRES_t1  = data2018.PRES;
dataMis2018_st1.WSPD_t1  = data2018.WSPD;
dataMis2018_st1.MIS_t1 = data2018.MIS;
%
dataMis2018_st1.MIS(1:end) = inf;
dataMis2018_st1.WSPD(1:end)  = inf;
dataMis2018_st1.PRES(1:end)  = inf;
dataMis2018_st1.APD(1:end)  = inf;
dataMis2018_st1.WTMP(1:end)  = inf;
%
dataMis2018_st1.MIS(1:end-1) = data2018.MIS(2:end);
dataMis2018_st1.WSPD(1:end-1)  = data2018.WSPD(2:end);
dataMis2018_st1.PRES(1:end-1)  = data2018.PRES(2:end);
dataMis2018_st1.APD(1:end-1)  = data2018.APD(2:end);
dataMis2018_st1.WTMP(1:end-1)  = data2018.WTMP(2:end);
idxInfMis = isinf(dataMis2018_st1.MIS);
dataMis2018_st1(idxInfMis,:) = []