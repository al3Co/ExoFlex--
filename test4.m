% get MSEs
clear
close
clc

% load('allFlexSensT1.mat')

T = struct2cell(load('allFlexSensT1.mat'));
T = T{1};

T = normalize(T(:,3:12),'range');

dosTres = immse(T.Var4, T.Var5);
cuatroCinco = immse(T.Var6, T.Var7);
tresOcho = immse(T.Var5, T.Var10);

int = [T.Var3, T.Var4, T.Var5, T.Var6, T.Var7];
ext = [T.Var8, T.Var9, T.Var10, T.Var11, T.Var12];

%int = int(1:20000,:);
%ext = ext(1:20000,:);
T = T(21800:35200,:);

figure(1)
plot([T.Var4, T.Var5])
title('Comparison Sensor 2 and 3','FontSize',15)
legend({'Sensor 2', 'Sensor 3'},'FontSize',14)
xlabel('timestamps','FontSize',15)
ylabel('Sensor value','FontSize',15)


figure(2)
plot([T.Var6, T.Var7])
title('Comparison Sensor 4 and 5','FontSize',15)
legend({'Sensor 4', 'Sensor 5'},'FontSize',14)
xlabel('timestamps','FontSize',15)
ylabel('Sensor value','FontSize',15)



figure(3)
plot([T.Var5, T.Var10])
title('Comparison Sensor 3 and 8','FontSize',15)
legend({'Sensor 3', 'Sensor 8'},'FontSize',14)
xlabel('Timestamps','FontSize',15)
ylabel('Sensor value','FontSize',15)
