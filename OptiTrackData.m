%% code to eliminate void values from apriori value
close all
clear
clc
%% 
% get data as table
% T = readtable('C:\Users\Aldo Contreras\Documents\ExoFlex\Jaime_TFM\OptiTrack\GREEN-FRONT2.csv');
ficherocsv = 'BLUE.csv';
T = readtable(ficherocsv);

% data = str2double([T.RigidBody(5:end) T.RigidBody_1(5:end) T.RigidBody_2(5:end) T.RigidBody_7(5:end) T.RigidBody_8(5:end) T.RigidBody_9(5:end)]);
data = str2double([T.Var1(5:end) T.Var2(5:end) T.RigidBody_3(5:end) T.RigidBody_4(5:end) T.RigidBody_5(5:end) T.RigidBody_10(5:end) T.RigidBody_11(5:end) T.RigidBody_12(5:end) T.Marker_18(5:end) T.Marker_19(5:end) T.Marker_20(5:end)]);
[m,n] = size(data);
pastData = 0;
% if nan value on matrix, nan changes for previous immediate value
for col=1:n
    for i = 1:m
      if isnan(data(i, col))
        data(i, col) = pastData;
      end
      pastData = data(i, col);
    end
    pastData = 0;
end

% create table
Sample = data(:,1);
Time = data(:,2);
BrazoX = data(:,3);
BrazoY = data(:,4);
BrazoZ = data(:,5);
EspaldaX = data(:,6);
EspaldaY = data(:,7);
EspaldaZ = data(:,8);
refX = data(:,9);
refY = data(:,10);
refZ = data(:,11);

hour = 1;
Start(1:m) = hour;
Start = Start';
GS_Pos2 = table(Sample, Time, BrazoX, BrazoY, BrazoZ, EspaldaX, EspaldaY, EspaldaZ, refX, refY, refZ, Start);

% % plotting "brazo", "espalda" and "referencia" position
% plot(data)