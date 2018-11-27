function T = testFunc(T_s, T_i)
% load flex sensor file
%T_s = struct2cell(load('C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\FlexSens\20181121-122033A.mat'));
%T_s = T_s{1};
% load imus file
%T_i = struct2cell(load('C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\IMUs\21T122029.mat'));
%T_i = T_i{1};

% change all time to milliseconds
flexTime = milliseconds(hours(T_s.HH) + minutes(T_s.MM) + seconds(T_s.SS)+ milliseconds(T_s.MS));
% change
%imusTime = milliseconds(hours(T_i.HH) + minutes(T_i.MM) + seconds(T_i.SS)+ milliseconds(T_i.MS));
for i = 1:height(T_i)
    imusTimeV(i,:) = datevec(T_i.TimeOpt(i));
end
imusTime = milliseconds(hours(imusTimeV(:,4)) + minutes(imusTimeV(:,5)) + seconds(imusTimeV(:,6)));
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
tBs = imusTime(2) - imusTime(1);

[m,n] = size(imusTime);
h = waitbar(0,'Synchronizing data...');
% for each sensors data starting with THE match
for iShort=0:(m-firstTimeSample)
    for iLarge=1:size(flexTime) % review if OptiTrack time matchs with each sensor time
        if (imusTime(iShort + firstTimeSample) + tBs) > flexTime(iLarge)
            vectorTime(iShort + firstTimeSample) = iLarge;
        end
    end
    waitbar(iShort / (m-firstTimeSample))
end
close(h)

% locating new data
varsS = T_s.Properties.VariableNames;
varsI = T_i.Properties.VariableNames;
[~,lenTime] = size(vectorTime);
h = waitbar(0,'Synchronizing Tables...');
T = table;
for increment = firstTimeSample:(lenTime)
    x = table(T_s(vectorTime(increment),varsS));
    y = table(T_i(increment,varsI));
    T = [T; [x.Var1, y.Var1]];
    waitbar(increment / (lenTime))
end
close(h)
end
% save('pqfile.mat','T')