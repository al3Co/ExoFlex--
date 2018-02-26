%Sensor time correction
function [SensorTime] = STCorrection(SensorFile)

x = readtable(SensorFile);
SensorTime = seconds(x.Hour + x.Minute + x.Sec);

end