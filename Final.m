clear
close all
clc

%% user data
prompt = ('Enter sensor data file name (XLS file): ');
sensorFile = input(prompt,'s');
prompt = ('Enter optitrack data file name (XLS file): ');
optiTrackXLS = input(prompt,'s');
prompt = ('Kind of Movement made: ');
typeOfMov = input(prompt,'s');

%% calculations
tic
% function to extract OptiTrack data and filling void spaces
[tableOpti] = OptiCoord(optiTrackXLS);
% function to get sensors table and Match time with OptiTrack Data
[tableSensorsData, tableMatched] = QuaternTimeCheck(tableOpti, sensorFile);
[tableMatched] = addType(tableMatched, typeOfMov);

%% create CSV file
toc
writetable(tableMatched,strcat(typeOfMov,'.csv'),'Delimiter',',','QuoteStrings',true);
disp('done')