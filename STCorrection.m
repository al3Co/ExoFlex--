%Sensor time correction
function [SensorTime] = STCorrection(SensorFile)

x = readtable(SensorFile);
Hours = x.Hour;
Minutes = x.Minute;
Seconds = x.Sec;
SensorTime = zeros(size(Hours,1),1);
for i=1:size(SensorTime,1)
    SensorTime(i,1) =  hours(str2num(Hours)) + minutes(str2num(Minutes)) + seconds(str2num(Seconds));
end

end