%Jaime Lorenzo
%Optitrack data reading
% 
%Import text of data
ficherocsv = 'C:\Users\disam\Documents\OneDrive_AldoContreras\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\OptiTrack\Sujeto3 2018-11-26 12.45.18 AM _.csv';
[num,txt,~] = xlsread(ficherocsv);
[TR] = RealTimeOpti(txt);
Frames = num(1,12) + 6;
Time = csvread(ficherocsv,7,1,[7,1,Frames,1]); 
%Matrix with time data
RealTime = Time;
%Matrix with real time data
for i=1:size(RealTime,1)
    RealTime(i,1) = seconds(TR) + RealTime(i,1);
end

ArmPos = csvread(ficherocsv,7,6,[7,6,Frames,8]); 
ArmAngle = csvread(ficherocsv,7,2,[7,2,Frames,4]);
Reference = csvread(ficherocsv,7,34,[7,34,Frames,36]);
Verticality = csvread(ficherocsv,7,9,[7,9,Frames,11]);

%Mostrar posiciones respecto al tiempo
% plot(Time,ArmAngle(:,1),'Color','b')
% hold on
% plot(Time,ArmAngle(:,2),'Color','g')
% plot(Time,ArmAngle(:,3),'Color','r')
% title('Posición Hombro')
% xlim([0 Time(size(Time,1),1)]);
% xlabel('Tiempo');
% ylabel('XYZ');
% set(gca,'XGrid','on','YGrid','on');
