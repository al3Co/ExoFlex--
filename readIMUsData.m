% read txt on directory and create workspace with 3 IMUs data
clear
close
clc

expand = 10;
c = 1;
% import data direcotry
dir_to_search = 'C:\Users\disam\Documents\GitHub\LPMS-IMUsensors';
txtpattern = fullfile(dir_to_search, '*.txt');
dinfo = dir(txtpattern);
tic
for K = 1 : length(dinfo)
    % for each file
    filename = fullfile(dir_to_search, dinfo(K).name);  %just the name
    disp(filename)
    T = readtable(filename);
    % read first IMU
    if c == 1
        DateVector = interpolSecsFunc(interpolFunc(datevec(T.Var1),expand,1));
        HH = DateVector(:,1);
        MM = DateVector(:,2);
        SS = DateVector(:,3);
        MS = DateVector(:,4);
        t_result = table(HH,MM,SS,MS);
        data = num2cell(interpolFunc(table2array(T(:,14:20)),expand,3));
        t_result(:,5:11) = data;
        varNames = {'HH','MM','SS','MS','QB1','QB2','QB3','QB4','EuB1','EuB2','EuB3'};
        t_result.Properties.VariableNames = varNames;
    end
    % read second IMU
    if c == 2
        data = num2cell(interpolFunc(table2array(T(:,14:20)),expand,3));
        t_result(:,12:18) = data;
        varNames = {'HH','MM','SS','MS','QB1','QB2','QB3','QB4','EuB1','EuB2','EuB3'...
            'QA1','QA2','QA3','QA4','EuA1','EuA2','EuA3'};
        t_result.Properties.VariableNames = varNames;
    end
    % read third IMU
    if c == 3
        data = num2cell(interpolFunc(table2array(T(:,14:20)),expand,3));
        t_result(:,19:25) = data;
        varNames = {'HH','MM','SS','MS','QB1','QB2','QB3','QB4','EuB1','EuB2','EuB3'...
            'QA1','QA2','QA3','QA4','EuA1','EuA2','EuA3'...
            'QArm1','QArm2','QArm3','QArm4','EuArm1','EuArm2','EuArm3'};
        t_result.Properties.VariableNames = varNames;
        nameSave = strcat(erase(extractAfter(filename,'11-'),'.txt'),'.mat');
        save(nameSave,'t_result')
        c = 0;
    end
    c = c+1;
end
toc

% read
% T(:,1:2);     % hour
% T(:,3);       % time stamp
% T(:,4);       % Sample
% T(:,5:7);     % Gyr
% T(:,8:10);    % Acc
% T(:,11:13);   % Mag
% T(:,14:17);   % Quat
% T(:,18:20);   % Euler
% T(:,21:23);   % linAcc