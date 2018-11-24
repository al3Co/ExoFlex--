% read txt with IMUs data
clear
close
clc

Ttotal = [];
T3 = [];
c = 1;

% import data direcotry
dir_to_search = 'C:\Users\disam\Documents\OneDrive_AldoContreras\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\IMUs';
txtpattern = fullfile(dir_to_search, '*.txt');
dinfo = dir(txtpattern);

for K = 1 : length(dinfo)
    filename = fullfile(dir_to_search, dinfo(K).name);  %just the name
    disp(filename)
    T = readtable(filename);
    imusQuat = table2array(T(:,14:17));
    if c<=3
        T3 = [T3, imusQuat];
    end

    plot(imusQuat)
    title(filename)
    pause(4)
    
    if c == 3
        Ttotal = [Ttotal; T3];
%         plot(T3)
%         pause(1)
        T3=[];
        c = 0;
    end
    c = c+1;
end
% plot(Ttotal)

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