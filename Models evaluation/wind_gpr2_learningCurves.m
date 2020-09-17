% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
trainingData = dataWind2018_st1;
inputTable = trainingData;
predictorNames = {'WSPDt_1', 'ATMPt_1', 'PRESt_1'};
predictors = inputTable(:, predictorNames);
response = inputTable.WSPD;
isCategoricalPredictor = [false, false, false];

% Train a regression model

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
gpPredictFcn = @(x) predict(regressionGP, x);
trainedModel.predictFcn = @(x) gpPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedModel.RequiredVariables = {'ATMPt_1', 'PRESt_1', 'WSPDt_1'};
trainedModel.RegressionGP = regressionGP;
trainedModel.About = 'This struct is a trained model exported from Regression Learner R2020a.';
trainedModel.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appregression_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
m = 10:500:size(trainingData,1);
pos=1;
for i = m
inputTable = trainingData(1:i,:);
predictorNames = {'WSPDt_1', 'ATMPt_1', 'PRESt_1'};
predictors = inputTable(:, predictorNames);
response = inputTable.WSPD;
isCategoricalPredictor = [false, false, false];

% Set up holdout validation
cvp = cvpartition(size(response, 1), 'Holdout', 0.2);
trainingPredictors = predictors(cvp.training, :);
trainingResponse = response(cvp.training, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;

% Train a regression model
% This code specifies all the model options and trains the model.
regressionGP = fitrgp(...
    trainingPredictors, ...
    trainingResponse, ...
    'BasisFunction', 'constant', ...
    'KernelFunction', 'matern52', ...
    'Standardize', true);

% Create the result struct with predict function
gpPredictFcn = @(x) predict(regressionGP, x);
validationPredictFcn = @(x) gpPredictFcn(x);

% Add additional fields to the result struct
% Compute training RMSE
isNotMissing = ~isnan(trainingPredictions) & ~isnan(trainingResponse);
RMSE_windgpr2(pos,1) = sqrt(nansum(( trainingPredictions - trainingResponse ).^2) / numel(trainingResponse(isNotMissing) ));

% Compute validation predictions
validationPredictors = predictors(cvp.test, :);
validationResponse_windgpr2 = response(cvp.test, :);
validationPredictions_windgpr2 = validationPredictFcn(validationPredictors);

% Compute validation RMSE
isNotMissing = ~isnan(validationPredictions) & ~isnan(validationResponse);
RMSE_windgpr2(pos,2) = sqrt(nansum(( validationPredictions - validationResponse ).^2) / numel(validationResponse(isNotMissing) ));
pos = pos + 1;
end

%Plot learning curves
figure
plot(m,RMSE_windgpr2(:,1),m,RMSE_windgpr2(:,2))
title('GPR (wind speed 1 h-before as predictor)')
yline(0.9,'--')
legend('Training error', 'Validation error','Reference error')
xlabel('m')
ylabel('error (RMSE)')
