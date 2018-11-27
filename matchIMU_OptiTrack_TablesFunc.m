clc
clear
close
% imu = Optitrack
% flex = sensors
load('test.mat')
imusTime = milliseconds(hours(T_s.HH) + minutes(T_s.MM) + seconds(T_s.SS)+ milliseconds(T_s.MS));
flexTime = T_i.TimeOpt;

% verify where it start with same time
% the short runs the large
for increment=1:size(imusTime)
     if imusTime(increment) >= flexTime(1)
         firstTimeSample = increment + 1;
         fprintf('Match found num: %d. Sensors: %d OptiTrack: %d \n',firstTimeSample, imusTime(increment),(flexTime(1)));
         break
     elseif increment == size(imusTime)
         fprintf('Counter increment: %d. Time files do not match\n',increment);
         return
     end
end

% time between OptiTrack samples
%tBtOptiTrack = tableOpti.RealTime(2) - tableOpti.RealTime(1);
%tBs = imusTime(2) - imusTime(1);
tBs = flexTime(2) - flexTime(1);
%tic
[m,~] = size(imusTime);
h = waitbar(0,'Synchronizing data...');
% for each sensors data starting with THE match
for iShort=0:(m-firstTimeSample)
    for iLarge=1:size(flexTime) % review if OptiTrack time matchs with each sensor time
        if flexTime(iLarge)>= imusTime(iShort+firstTimeSample) 
           vectorTime(iShort+ firstTimeSample) = iLarge;
           %sprintf('%f > %f ', flexTime(iLarge), imusTime(iShort+firstTimeSample))
           %pause(1)
           break
        end
    end
    waitbar(iShort / (m-firstTimeSample))
end
close(h)


% sprintf('%f > %f', (imusTime(iShort + firstTimeSample) + tBs),flexTime(iLarge))