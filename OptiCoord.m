%Jaime Lorenzo
%Optitrack data reading
function [table_Pos] = OptiCoord(ficherocsv)

%Import text of data
ficheroxlsx = [ficherocsv, '.xlsx'];
[num,txt,~] = xlsread(ficheroxlsx);
[TR] = RealTimeOpti(txt);
Frames = num(1,12) + 6;
ficherocsv = [ficherocsv, '.csv'];
Time = csvread(ficherocsv,7,1,[7,1,Frames,1]);

%Matrix with time data
RealTime = Time;

%Matrix with real time data
for i=1:size(RealTime,1)
    RealTime(i,1) = seconds(TR) + RealTime(i,1);
end

% ArmPos = csvread(ficherocsv,7,6,[7,6,Frames,8]); 
% ArmAngle = csvread(ficherocsv,7,2,[7,2,Frames,4]);
% Reference = csvread(ficherocsv,7,34,[7,34,Frames,36]);
% Verticality = csvread(ficherocsv,7,9,[7,9,Frames,11]);

%% complete void spaces on Optitrack data
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
table_Pos = table(Sample, Time, BrazoX, BrazoY, BrazoZ, EspaldaX, EspaldaY, EspaldaZ, refX, refY, refZ, RealTime);

end