function [sensorDataTable, tableMatched] = QuaternTimeCheck(table_Pos, SensorFile)
%% get time from sensors file
sensorDataTable = readtable(SensorFile);
SensorTime = seconds(hours(sensorDataTable.Hour) + minutes(sensorDataTable.Minute) + seconds(sensorDataTable.Sec));

%% initialize variables
Sample = zeros(size(SensorTime,1),1);
Time = zeros(size(SensorTime,1),1);
BrazoX = zeros(size(SensorTime,1),1);
BrazoY = zeros(size(SensorTime,1),1);
BrazoZ = zeros(size(SensorTime,1),1);
EspaldaX = zeros(size(SensorTime,1),1);
EspaldaY = zeros(size(SensorTime,1),1);
EspaldaZ = zeros(size(SensorTime,1),1);
refX = zeros(size(SensorTime,1),1);
refY = zeros(size(SensorTime,1),1);
refZ = zeros(size(SensorTime,1),1);
realTime = zeros(size(SensorTime,1),1);

vectorTime = zeros(size(SensorTime,1),1);
firstTimeSample = 0;

%% verify where to start with same times (Opti and Sensors)
for increment=1:size(SensorTime)
     if SensorTime(increment) >= table_Pos.RealTime(1)
         fprintf('sensors: %d OptiTrack: %d  synchronizing...\n',SensorTime(increment),(table_Pos.RealTime(1)));
         firstTimeSample = increment;
         break
     end
end

% time between tests
tBtOptiTrack = table_Pos.RealTime(2) - table_Pos.RealTime(1);

% travel vectors to match time
for incrementST=1:(size(SensorTime)-firstTimeSample)
    for incrementOpT=1:size(table_Pos.RealTime) % improve this method
        if (SensorTime(incrementST + firstTimeSample) + tBtOptiTrack) > table_Pos.RealTime(incrementOpT)
            vectorTime(incrementST + firstTimeSample) = incrementOpT;
        end
    end
end

% create new table locating new data
for increment = (firstTimeSample + 1):(size(vectorTime))
    Sample(increment,1) = table_Pos.Sample(vectorTime(increment));
    Time(increment,1) = table_Pos.Time(vectorTime(increment));
    BrazoX(increment,1) = table_Pos.BrazoX(vectorTime(increment));
    BrazoY(increment,1) = table_Pos.BrazoY(vectorTime(increment));
    BrazoZ(increment,1) = table_Pos.BrazoZ(vectorTime(increment));
    EspaldaX(increment,1) = table_Pos.EspaldaX(vectorTime(increment));
    EspaldaY(increment,1) = table_Pos.EspaldaY(vectorTime(increment));
    EspaldaZ(increment,1) = table_Pos.EspaldaZ(vectorTime(increment));
    refX(increment,1) = table_Pos.refX(vectorTime(increment));
    refY(increment,1) = table_Pos.refY(vectorTime(increment));
    refZ(increment,1) = table_Pos.refZ(vectorTime(increment));
    realTime(increment,1) = table_Pos.RealTime(vectorTime(increment));
end

tableMatched = table(Sample, Time, BrazoX, BrazoY, BrazoZ, EspaldaX, EspaldaY, EspaldaZ, refX, refY, refZ, realTime);

end

