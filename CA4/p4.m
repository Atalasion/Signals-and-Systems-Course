clc
close all;
clear;
load('TrainedModel.mat', 'TrainedModel');
load('diabetestrainig.mat', 'diabetestraining');
load('diabetesvalidation.mat', 'diabetesvalidation');
[yfit, score] = TrainedModel.predictFcn(diabetestraining);
diabet = table2array(diabetestraining(:, "label"));
sum = 0;
for i=1:600
    if (diabet(i, 1) == yfit(i, 1))
        sum = sum + 1;
    end
end
sum / 600 * 100

sum = 0;
[yfit, score] = TrainedModel.predictFcn(diabetesvalidation);
diabet = table2array(diabetesvalidation(:,"label"));
for i=1:100
    if (diabet(i, 1) == yfit(i, 1))
        sum = sum + 1;
    end
end
sum / 100 * 100
