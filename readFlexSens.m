clear
close
clc

Ttotal = [];
% import FS direcotry
dir_FS = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\FlexSens';
dinfoFS = dir(fullfile(dir_FS, '*.mat'));
% import IMU direcotry
dir_IMU = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\IMUs';
dinfoIMU = dir(fullfile(dir_IMU, '*.mat'));

% read each file
for K = 1 : length(dinfoFS)
    disp(K)
    % FlexSens files
    filenameS = fullfile(dir_FS, dinfoFS(K).name);
    nameS = extractAfter(filenameS,'2018');
    disp(nameS)
    T_s = struct2cell(load(filenameS));
    T_s = T_s{1};
    % imus files
    filenameI = fullfile(dir_IMU, dinfoIMU(K).name);
    nameIMU = extractAfter(filenameI,'\IMUs\');
    disp(nameIMU)
    T_i = struct2cell(load(filenameI));
    T_i = T_i{1};
    % match data
    % T = matchIMU_FlexSTablesFunc(T_s, T_i, 1);
    % store variable
    nameSave = strcat('IMU_FS_',extractAfter(filenameI,'\IMUs\'));
    save(nameSave,'T')
end
