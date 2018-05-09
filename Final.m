clear
close all
clc

%% user data
prompt = ('Enter sensor data file name (XLS file): ');
sensorFile = input(prompt,'s');
prompt = ('Enter optitrack data file name (XLS file): ');
optiTrackXLS = input(prompt,'s');
prompt = ('Kind of Movement made (COMBO, CRUZEXT, CRUZINT, ...): ');
typeOfMov = input(prompt,'s');

%% calculations
tic
disp('Reading files...')
% function to extract OptiTrack data and filling void spaces
[tableOpti] = OptiCoord(optiTrackXLS);
% function to get sensors table and Match time with OptiTrack Data
[tableSensorsData, tableMatched] = QuaternTimeCheck(tableOpti, sensorFile);
% add type of movement
[allDataTable] = addType(tableSensorsData, tableMatched, typeOfMov);
toc

%% create CSV file and save Workspace
fileName = sensorFile(1:end-4);
writetable(allDataTable,strcat(fileName,'.csv'),'Delimiter',',','QuoteStrings',true);
save(fileName)
disp('Done')