% compare interior and interior sensors

clear
close
clc

plotData = false;
smooth = true;
MSEtotal = [];
RMSEtotal = [];
Ttotal = [];
% import data direcotry
dir_to_search = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\FlexSens';
txtpattern = fullfile(dir_to_search, '*.txt');
dinfo = dir(txtpattern);

for K = 1 : length(dinfo)
    filename = fullfile(dir_to_search, dinfo(K).name);  %just the name
    
    % disp(filename)
    
    T = readtable(filename);
    % T = readtable(char(fileNames(1)));
    ext = [T.Var3, T.Var4, T.Var5, T.Var6, T.Var7];
    int = [T.Var8, T.Var9, T.Var10, T.Var11, T.Var12];
    Ttotal = [Ttotal; T];
    % smooth
    if smooth
        int = sgolayfilt(int,3,41);
        ext = sgolayfilt(ext,3,41);
    end
    % normalize data
    intN = normalize(int,'range');
    extN = normalize(ext,'range');

    % error
    [E,SQE,MSE,RMSE] = errorCalcFunc (intN, extN);
    
    MSEtotal(K,:) = MSE;
    RMSEtotal(K,:) = RMSE;
    
    % plot data
    if plotData
        sensor = 2;
        figure(1)
        plotIntVsExt (intN, extN)
        figure(2)
        plotIntVsExt (intN(:,sensor), extN(:,sensor))
        figure(3)
        bar(MSE)
        figure(4)
        bar(RMSE)
        pause(5)
    end
end

% smooth all test data
if smooth
    Ttotal(:,3:12) = array2table(sgolayfilt(table2array(Ttotal(:,3:12)),3,41));
end
extT = [Ttotal.Var3, Ttotal.Var4, Ttotal.Var5, Ttotal.Var6, Ttotal.Var7];
intT = [Ttotal.Var8, Ttotal.Var9, Ttotal.Var10, Ttotal.Var11, Ttotal.Var12];

% all test Data
% normalize data
extT = normalize(extT,'range');
intT = normalize(intT,'range');
[E,SQE,MSE,RMSE] = errorCalcFunc (intT, extT);
meanRMSE = RMSE;

figure(1)
hold on
bar(RMSEtotal)

xlabel('Number of tests');
ylabel('RMSE');
legend('Sensors Position A','Sensors Position B','Sensors Position C',...
    'Sensors Position C','Sensors Position D');
title('Root Mean Square Error between interior and exterior sensors');
hold off

figure(2)
hold on
bar(meanRMSE)
xlabel('Sensor Position');
ylabel('RMSE');
title('Root Mean Square Error between interior and exterior sensors');
hold off

