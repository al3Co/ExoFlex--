% angle
clc
clear
close

load('AllData.mat')

imuA = [Tt.EuA1, Tt.EuA2, Tt.EuA3];
imuB = [Tt.EuB1, Tt.EuB2, Tt.EuB3];

y = imuA;
yhat = imuB;
err = (y - yhat);    % Errors
se = (y - yhat).^2;   % Squared Error
mse = mean((y - yhat).^2);   % Mean Squared Error
rmse = sqrt(mean((y - yhat).^2));  % Root Mean Squared Error

errM = immse(y,yhat);