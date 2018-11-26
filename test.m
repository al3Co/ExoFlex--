function t_result convertToTable (T, num)
% T = load('20181121-134612A.mat');
% T = struct2cell(T);
% T = T{1};
expand = 10;
T = readtable('C:\Users\disam\Documents\OneDrive_AldoContreras\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\IMUs\Aldo1dataIMU1_2018-11-21T124548.txt');
% time
if num == 1
    DateVector = interpolSecsFunc(interpolFunc(datevec(T.Var1),expand,1));
    HH = DateVector(:,1);
    MM = DateVector(:,2);
    SS = DateVector(:,3);
    MS = DateVector(:,4);
    t_result = table(HH,MM,SS,MS);
end

% Quaternions
imuData = interpolFunc(table2array(T(:,14:20)),expand,3);
% create table with data
data = num2cell(imuData);
t_result(:,5:11) = data;
varNames = {'HH','MM','SS','MS','Q1','Q2','Q3','Q4','Eu1','Eu2','Eu3'};
t_result.Properties.VariableNames = varNames;
end