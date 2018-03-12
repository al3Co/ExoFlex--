clear
close all
clc

prompt = ('Enter sensor data file name: ');
sensorFile = input(prompt,'s');
prompt = ('Enter optitrack data file name: ');
ficheroCSV = input(prompt,'s');

% function to extract OptiTrack data and filling void spaces
[table_Pos] = OptiCoord(ficheroCSV); % improve this function (file's name)
% function to get sensors table and Match time with OptiTrack Data
[sensorDataTable, tableMatched] = QuaternTimeCheck(table_Pos, sensorFile);