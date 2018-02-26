prompt = ('Enter sensor data file name: ');
SensorFile = input(prompt,'s');
prompt = ('Enter optitrack data file name: ');
ficherocsv = input(prompt,'s');

[ArmPos,ArmAngle,Reference,Verticality,RealTime] = OptiCoord(ficherocsv);
%[ArmPosT,ArmAngle,ReferenceT,VerticalityT] = CoordTrans(ArmPos,ArmAngle,Reference,Verticality);
[qx,qy,qz,qw] = QuaternTimeCheck(SensorFile,ArmAngle,RealTime);