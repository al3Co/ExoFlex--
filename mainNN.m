% NN time series

clear
close
clc

global_performance = [];
global_regression = [];
% import INPUTS
dir_input = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\NNs\Input';
dinfoinput = dir(fullfile(dir_input, '*.mat'));
% import TARGETS
dir_target = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\NNs\Target';
dinftarget = dir(fullfile(dir_target, '*.mat'));
% hidden leyers
hiddenL = [10 20 30];
delays = [2];
% read each file
for K = 1 : length(dinfoinput)
    % input files
    filenameI = fullfile(dir_input, dinfoinput(K).name);
    disp(extractAfter(filenameI,'\Input\'))
    T_input = struct2cell(load(filenameI));
    T_input = T_input{1};
    
    % output files
    filenameT = fullfile(dir_target, dinftarget(K).name);
    disp(extractAfter(filenameT,'\Target\'))
    T_target = struct2cell(load(filenameT));
    T_target = T_target{1};
    
    [~, li] = size(T_input);
    [~, lt] = size(T_target);
    for h = 1 :length(hiddenL)
        for d = 1:length(delays)
            fprintf('NN file:%d hidden:%d delay:%d Input:%d Target:%d \n',K, hiddenL(h), delays(d), li, lt);
            % NN function
            [results, regr] = timeSeriesNN(T_input,T_target, hiddenL(h), delays(d));
            % results storage
            global_performance = [global_performance; results];
            global_regression = [global_regression; regr];
        end
    end
end
clear('K', 'dir_input', 'dinfoinput', 'dir_target', 'dinftarget', 'h', 'd');

csvwrite('global_performance.csv',global_performance) 
csvwrite('global_regression.csv',global_regression)
