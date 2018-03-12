prompt = ('Enter sensor data file name: ');
sensorFile = input(prompt,'s');
prompt = ('Enter optitrack data file name: ');
ficheroCSV = input(prompt,'s');

[table_Pos] = OptiCoord(ficheroCSV);
[X,Y,Z,XV,YV,ZV] = QuaternTimeCheck(table_Pos, sensorFile);
% BrazoGF = [X,Y,Z];
% EspaldaGF = [XV,YV,ZV];