dataWind2018_st14 = data2018;
dataWind2018_st14.WSPDt_14 = data2018.WSPD;
dataWind2018_st14.WSPDt_13 = data2018.WSPD;
dataWind2018_st14.WSPDt_12 = data2018.WSPD;
dataWind2018_st14.WSPDt_11 = data2018.WSPD;
dataWind2018_st14.WSPDt_10 = data2018.WSPD;
dataWind2018_st14.WSPDt_9 = data2018.WSPD;
dataWind2018_st14.WSPDt_8 = data2018.WSPD;
dataWind2018_st14.WSPDt_7 = data2018.WSPD;
dataWind2018_st14.WSPDt_6 = data2018.WSPD;
dataWind2018_st14.WSPDt_5 = data2018.WSPD;
dataWind2018_st14.WSPDt_4 = data2018.WSPD;
dataWind2018_st14.WSPDt_3 = data2018.WSPD;
dataWind2018_st14.WSPDt_2 = data2018.WSPD;
dataWind2018_st14.WSPDt_1 = data2018.WSPD;


dataWind2018_st14.WSPDt_14(1:end) = inf;
dataWind2018_st14.WSPDt_13(1:end) = inf;
dataWind2018_st14.WSPDt_12(1:end) = inf;
dataWind2018_st14.WSPDt_11(1:end) = inf;
dataWind2018_st14.WSPD(1:end) = inf;
dataWind2018_st14.WSPDt_10(1:end) = inf;
dataWind2018_st14.WSPDt_9(1:end) = inf;
dataWind2018_st14.WSPDt_8(1:end) = inf;
dataWind2018_st14.WSPDt_7(1:end) = inf;
dataWind2018_st14.WSPDt_6(1:end) = inf;
dataWind2018_st14.WSPDt_5(1:end) = inf;
dataWind2018_st14.WSPDt_4(1:end) = inf;
dataWind2018_st14.WSPDt_3(1:end) = inf;
dataWind2018_st14.WSPDt_2(1:end) = inf;
dataWind2018_st14.WSPDt_1(1:end) = inf;


dataWind2018_st14.WSPD(1:end-14) = data2018.WSPD(15:end);
dataWind2018_st14.WSPDt_1(1:end-13) = data2018.WSPD(14:end);
dataWind2018_st14.WSPDt_2(1:end-12) = data2018.WSPD(13:end);
dataWind2018_st14.WSPDt_3(1:end-11) = data2018.WSPD(12:end);
dataWind2018_st14.WSPDt_4(1:end-10) = data2018.WSPD(11:end);
dataWind2018_st14.WSPDt_5(1:end-9) = data2018.WSPD(10:end);
dataWind2018_st14.WSPDt_6(1:end-8) = data2018.WSPD(9:end);
dataWind2018_st14.WSPDt_7(1:end-7) = data2018.WSPD(8:end);
dataWind2018_st14.WSPDt_8(1:end-6) = data2018.WSPD(7:end);
dataWind2018_st14.WSPDt_9(1:end-5) = data2018.WSPD(6:end);
dataWind2018_st14.WSPDt_10(1:end-4) = data2018.WSPD(5:end);
dataWind2018_st14.WSPDt_11(1:end-3) = data2018.WSPD(4:end);
dataWind2018_st14.WSPDt_12(1:end-2) = data2018.WSPD(3:end);
dataWind2018_st14.WSPDt_13(1:end-1) = data2018.WSPD(2:end);
dataWind2018_st14.WSPDt_14(1:end) = data2018.WSPD(1:end);
%
idxInfWSPD = isinf(dataWind2018_st14.WSPD);
dataWind2018_st14(idxInfWSPD,:) = [];