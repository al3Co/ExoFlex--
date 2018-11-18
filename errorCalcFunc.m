function [E,SQE,MSE,RMSE] = errorCalcFunc (a,b)
    % error
    y = a;
    yhat = b;

    E = (y - yhat);    % Errors
    SQE = (y - yhat).^2;   % Squared Error
    MSE = mean((y - yhat).^2);   % Mean Squared Error
    RMSE = sqrt(mean((y - yhat).^2));  % Root Mean Squared Error
    % disp(RMSE)
end