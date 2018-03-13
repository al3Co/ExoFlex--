clear
close all
clc

prompt = ('Enter sensor data file name (XLS file): ');
sensorFile = input(prompt,'s');
prompt = ('Enter optitrack data file name (XLS file): ');
optiTrackXLS = input(prompt,'s');
tic
% function to extract OptiTrack data and filling void spaces
[tableOpti] = OptiCoord(optiTrackXLS);
% function to get sensors table and Match time with OptiTrack Data
[tableSensorsData, tableMatched] = QuaternTimeCheck(tableOpti, sensorFile);
toc
disp('done')