clear
close
clc

Ttotal = [];
% import FS-IMU direcotry
dir_FS = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\Match';
dinfoFS = dir(fullfile(dir_FS, '*.mat'));
% import Opti direcotry
dir_IMU = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\OptiTrack\mat';
dinfoIMU = dir(fullfile(dir_IMU, '*.mat'));
%
% read each file
for K = 1 : length(dinfoFS)
    disp(K)
    % FlexSens files
    filenameS = fullfile(dir_FS, dinfoFS(K).name);
    nameS = extractAfter(filenameS,'\Match\');
    disp(nameS)
    T_s = struct2cell(load(filenameS));
    T_s = T_s{1};
    % imus files
    filenameI = fullfile(dir_IMU, dinfoIMU(K).name);
    nameIMU = extractAfter(filenameI,'\mat\');
    disp(nameIMU)
    T_i = struct2cell(load(filenameI));
    T_i = T_i{1};
    % match data
    T = testFunc(T_s, T_i);
    % % store variable
    nameSave = strcat('DataT_',extractAfter(filenameI,'\mat\'));
    save(nameSave,'T')
end
