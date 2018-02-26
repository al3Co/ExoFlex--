function [qx,qy,qz,qw] = QuaternTimeCheck(SensorFile,ArmAngle,RealTime)

SensorTime = STCorrection(SensorFile);

qx = zeros(size(SensorTime,1),1);
qy = zeros(size(SensorTime,1),1);
qz = zeros(size(SensorTime,1),1);
qw = zeros(size(SensorTime,1),1);

for i=1:size(SensorTime,1)
    for j=1:size(RealTime,1)
        if SensorTime(i,1) <= RealTime(j,1)
            t = j;
            break
        end
    end
    v = t-1;
    while ArmAngle(v,1) == 0
        v = v-1;
    end
    while ArmAngle(t,1) == 0
        t = t+1;
    end   
    if SensorTime(i,1) == RealTime(t,1)
          qx(i,1) = ArmAngle(t,1);
          qy(i,1) = ArmAngle(t,2);
          qz(i,1) = ArmAngle(t,3);
          qw(i,1) = ArmAngle(t,4);
    else
          qx(i,1) = -(((ArmAngle(t,1)-ArmAngle(v,1))*(RealTime(t,1)-SensorTime(i,1))/(RealTime(t,1)-RealTime(v,1)))+ArmAngle(t,1));
          qy(i,1) = -(((ArmAngle(t,1)-ArmAngle(v,2))*(RealTime(t,1)-SensorTime(i,1))/(RealTime(t,1)-RealTime(v,1)))+ArmAngle(t,2));
          qz(i,1) = -(((ArmAngle(t,1)-ArmAngle(v,3))*(RealTime(t,1)-SensorTime(i,1))/(RealTime(t,1)-RealTime(v,1)))+ArmAngle(t,3));
          qw(i,1) = -(((ArmAngle(t,1)-ArmAngle(v,4))*(RealTime(t,1)-SensorTime(i,1))/(RealTime(t,1)-RealTime(v,1)))+ArmAngle(t,4));   
    end
end

