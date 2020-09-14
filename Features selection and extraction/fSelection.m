function [idx,scores,b1] = fSelection(data,predictiveName)
%FSELECTION execute the F-test for the predictive variable (predictive
%Name) considering the rest of features as predictors
%INPUTS
    %data: data set table
    %predictiveName: name of the dependent feature (predictive feature)
%OUTPUTS
    %idx: indices of predictors ordered by predictor importance
    %scores: F-test score associated to each predictor
    %b1:  bars figure
% Author: Montserrat Sacie Alcázar
%------------------------------------------------------------------------
data = movevars(data,predictiveName,'After',size(data,2));
[idx,scores] = fsrftest(data,predictiveName);
idxInf = find(isinf(scores));

if sum(idxInf) > 0
    scores(idxInf) = 0;
    maximo = max(scores);
    scores(idxInf) = maximo;
end
b1 = bar(scores(idx),'FaceAlpha',0.5,'FaceColor',[0.3010, 0.7450, 0.9330]);
xlabel('Predictor rank')
xticklabels(data.Properties.VariableNames(idx))
xtickangle(45)
ylabel('Predictor importance score')
title(strcat('Features F-test scores for',{' '},predictiveName,{' '},'forecasting'))
hold on
bar(scores(idx(length(idxInf)+1))*ones(length(idxInf),1),'FaceAlpha',0.5,'FaceColor',[0.4940, 0.1840, 0.5560])
legend('Finite Scores','Inf Scores')
hold off
end

