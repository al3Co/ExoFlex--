% read txt with IMUs data
clear
close
clc

Ttotal = [];
T3 = [];
expand = 10;
plotOpt = false;
c = 1;
% import data direcotry
dir_to_search = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\IMUs';
txtpattern = fullfile(dir_to_search, '*.txt');
dinfo = dir(txtpattern);
tic
for K = 1 : length(dinfo)
    filename = fullfile(dir_to_search, dinfo(K).name);  %just the name
    disp(filename)
    
    T = readtable(filename);
    DateVector = interpolSecsFunc(interpolFunc(datevec(T.Var1),expand,1));
    imusQuat = interpolFunc(table2array(T(:,14:17)),expand,3);
    
    imuData = [DateVector, imusQuat];
    
    if c<=3
        T3 = [T3, imusQuat];
    end
    if plotOpt
        plot(imusQuat)
        title(filename)
        pause(3)
    end
    if c == 3
        Ttotal = [Ttotal; T3];
        T3=[];
        c = 0;
    end
    c = c+1;
    % save(filename,variables)
end
toc
plot(Ttotal)

% read
% T(:,1:2);     % hour
% T(:,3);       % time stamp
% T(:,4);       % Sample
% T(:,5:7);     % Gyr
% T(:,8:10);    % Acc
% T(:,11:13);   % Mag
% T(:,14:17);   % Quat
% T(:,18:20);   % Euler
% T(:,21:23);   % linAcc