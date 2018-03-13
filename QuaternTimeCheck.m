function [sensorDataTable, tableMatched] = QuaternTimeCheck(tableOpti, SensorFile)
%% get time from sensors file
sensorDataTable = readtable(SensorFile);
sensorsTime = seconds(hours(sensorDataTable.Hour) + minutes(sensorDataTable.Minute) + seconds(sensorDataTable.Sec));

%% initialize variables
Frame = zeros(size(sensorsTime,1),1);
Time = zeros(size(sensorsTime,1),1);
BrazoX = zeros(size(sensorsTime,1),1);
BrazoY = zeros(size(sensorsTime,1),1);
BrazoZ = zeros(size(sensorsTime,1),1);
EspaldaX = zeros(size(sensorsTime,1),1);
EspaldaY = zeros(size(sensorsTime,1),1);
EspaldaZ = zeros(size(sensorsTime,1),1);
refX = zeros(size(sensorsTime,1),1);
refY = zeros(size(sensorsTime,1),1);
refZ = zeros(size(sensorsTime,1),1);
realTime = zeros(size(sensorsTime,1),1);

vectorTime = zeros(size(sensorsTime,1),1);
firstTimeSample = 0;

%% verify where to start with same times (Opti and Sensors)
for increment=1:size(sensorsTime)
     if sensorsTime(increment) >= tableOpti.RealTime(1)
         fprintf('sensors: %d OptiTrack: %d  synchronizing...\n',sensorsTime(increment),(tableOpti.RealTime(1)));
         firstTimeSample = increment;
         break
     elseif increment == size(sensorsTime)
         fprintf('Counter increment: %d files not match\n',increment);
         return
     end
end

% time between tests
tBtOptiTrack = tableOpti.RealTime(2) - tableOpti.RealTime(1);

%% travel vectors to match time
% for each data sensor review if OptiTrack data match with (sensors time +
% time between tests of OptiTrack samples)
for incrementST=1:(size(sensorsTime)-firstTimeSample)
    for incrementOpT=1:size(tableOpti.RealTime) % improve this method
        if (sensorsTime(incrementST + firstTimeSample) + tBtOptiTrack) > tableOpti.RealTime(incrementOpT)
            vectorTime(incrementST + firstTimeSample) = incrementOpT;
        end
    end
end

% locating new data
for increment = (firstTimeSample + 1):(size(vectorTime))
    Frame(increment,1) = tableOpti.Frame(vectorTime(increment));
    Time(increment,1) = tableOpti.Time(vectorTime(increment));
    BrazoX(increment,1) = tableOpti.BrazoX(vectorTime(increment));
    BrazoY(increment,1) = tableOpti.BrazoY(vectorTime(increment));
    BrazoZ(increment,1) = tableOpti.BrazoZ(vectorTime(increment));
    EspaldaX(increment,1) = tableOpti.EspaldaX(vectorTime(increment));
    EspaldaY(increment,1) = tableOpti.EspaldaY(vectorTime(increment));
    EspaldaZ(increment,1) = tableOpti.EspaldaZ(vectorTime(increment));
    refX(increment,1) = tableOpti.refX(vectorTime(increment));
    refY(increment,1) = tableOpti.refY(vectorTime(increment));
    refZ(increment,1) = tableOpti.refZ(vectorTime(increment));
    realTime(increment,1) = tableOpti.RealTime(vectorTime(increment));
end

%% angles
brazoTmp = [(BrazoX - refX) (BrazoY - refY) (BrazoZ - refZ)];
espaldaTmp = [(EspaldaX - refX) (EspaldaY - refY) (EspaldaZ - refZ)];

angBrazoX = atan2(sqrt(brazoTmp(:,2).^2+brazoTmp(:,3).^2),brazoTmp(:,1));
angBrazoY = atan2(sqrt(brazoTmp(:,3).^2+brazoTmp(:,1).^2),brazoTmp(:,2));
angBrazoZ = atan2(sqrt(brazoTmp(:,1).^2+brazoTmp(:,2).^2),brazoTmp(:,3));

%% create table
tableMatched = table(Frame, Time, realTime, ...
    BrazoX, BrazoY, BrazoZ, angBrazoX, angBrazoY, angBrazoZ, ...
    EspaldaX, EspaldaY, EspaldaZ, ...
    refX, refY, refZ);

% % extract data
% v = [16 5 9 4 2 11 7 14];
% v = v(3:7)     % Extract the third through the seventh elements
% firstTimeSample // corte inicial
% if frame actual == frame pasado // corte final

end

