% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
trainingData = dataWind2018_shortTerm

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
svmPredictFcn = @(x) predict(regressionSVM, x);
trainedModel.predictFcn = @(x) svmPredictFcn(predictorExtractionFcn(x));

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
m = 10:500:size(trainingData,1);
pos=1;
for i = m
inputTable = trainingData;
predictorNames = {'WSPDt_2', 'WSPDt_1'};
predictors = inputTable(1:i, predictorNames);
response = inputTable.WSPD(1:i);
isCategoricalPredictor = [false, false];

% Set up holdout validation
cvp = cvpartition(size(response, 1), 'Holdout', 0.2);
trainingPredictors = predictors(cvp.training, :);
trainingResponse = response(cvp.training, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;

% Train a regression model
% This code specifies all the model options and trains the model.
regressionSVM = fitrsvm(...
    trainingPredictors, ...
    trainingResponse, ...
    'KernelFunction', 'gaussian', ...
    'PolynomialOrder', [], ...
    'KernelScale', 8.194746685760554, ...
    'BoxConstraint', 9.784796576301035, ...
    'Epsilon', 0.06671522976050458, ...
    'Standardize', false);

% Create the result struct with predict function
svmPredictFcn = @(x) predict(regressionSVM, x);
validationPredictFcn = @(x) svmPredictFcn(x);

% Add additional fields to the result struct

% Compute training predictions
trainingPredictions = predict(regressionSVM, trainingPredictors);

% Compute training RMSE
isNotMissing = ~isnan(trainingPredictions) & ~isnan(trainingResponse);
RMSE_windsvm1(pos,1) = sqrt(nansum(( trainingPredictions - trainingResponse ).^2) / numel(trainingResponse(isNotMissing) ));

% Compute validation predictions
validationPredictors = predictors(cvp.test, :);
validationResponse = response(cvp.test, :);
validationPredictions = validationPredictFcn(validationPredictors);

% Compute validation RMSE
isNotMissing = ~isnan(validationPredictions) & ~isnan(validationResponse);
RMSE_windsvm1(pos,2) = sqrt(nansum(( validationPredictions - validationResponse ).^2) / numel(validationResponse(isNotMissing) ));
pos = pos + 1;
end

%To plot learning curves
figure
plot(m,RMSE_windsvm1(:,1),m,RMSE_windsvm1(:,2))
title('SVM with wind speed in last 2 hours as predictors')
yline(0.9,'--')
legend('Training error', 'Validation error','Reference error')
xlabel('m')
ylabel('error (RMSE)')