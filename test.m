clc
close
clear

% T = load('20181121-134612A.mat');
% T = struct2cell(T);
% T = T{1};
expand = 10;
T = readtable('C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\IMUs\Aldo1dataIMU1_2018-11-21T124548.txt');
% time
tic
DateVector = interpolSecsFunc(interpolFunc(datevec(T.Var1),expand,1));
% Quaternions
imuData = interpolFunc(table2array(T(:,14:20)),expand,3);
toc
data = [DateVector, imuData];
% create table with data