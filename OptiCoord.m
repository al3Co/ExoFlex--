%Optitrack data reading
function [table_Pos] = OptiCoord(optiTrackXLS)
%% import text and time of OptiTrack data

% reading file
[num,txt,~] = xlsread(optiTrackXLS);

% adjunsting time 
RTime = RealTimeOpti(txt);
RealTime = num(8:end,2);
for i=1:size(RealTime)
    RealTime(i) = seconds(RTime) + RealTime(i);
end

%% complete void spaces Optitrack data
data = ([num(8:end,1) num(8:end,2) ...
        num(8:end,3) num(8:end,4) num(8:end,5) num(8:end,6) num(8:end,7) num(8:end,8) ...
        num(8:end,10) num(8:end,11) num(8:end,12) num(8:end,13) num(8:end,14) num(8:end,15) ...
        num(8:end,35) num(8:end,36) num(8:end,37)]);

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

%% create table
Frame = data(:,1);
Time = data(:,2);

BrazoRotX = data(:,3);
BrazoRotY = data(:,4);
BrazoRotZ = data(:,5);
BrazoX = data(:,6);
BrazoY = data(:,7);
BrazoZ = data(:,8);

EspaldaRotX = data(:,9);
EspaldaRotY = data(:,10);
EspaldaRotZ = data(:,11);
EspaldaX = data(:,12);
EspaldaY = data(:,13);
EspaldaZ = data(:,14);

refX = data(:,15);
refY = data(:,16);
refZ = data(:,17);

table_Pos = table(Frame, Time, RealTime, ...
            BrazoRotX, BrazoRotY, BrazoRotZ, BrazoX, BrazoY, BrazoZ, ...
            EspaldaRotX, EspaldaRotY, EspaldaRotZ, EspaldaX, EspaldaY, EspaldaZ, ...
            refX, refY, refZ);

end