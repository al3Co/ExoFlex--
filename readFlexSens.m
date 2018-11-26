clear
close
clc

Ttotal = [];
% import data direcotry
dir_to_search = 'C:\Users\disam\Documents\OneDrive_AldoContreras\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\FlexSens';
txtpattern = fullfile(dir_to_search, '*.mat');
dinfo = dir(txtpattern);

% read each file
for K = 1 : length(dinfo)
    filename = fullfile(dir_to_search, dinfo(K).name);  %just the name
    name = erase(extractAfter(filename,'1811'),'.mat');
    disp(name)
    T = struct2cell(load(filename));
    T = T{1};
    sens = [T.S1, T.S2, T.S3, T.S4, T.S5, T.S6, T.S7, T.S8, T.S9, T.S10];
    Ttotal = [Ttotal; sens];
    plot(sens)
    disp(K)
    pause(1)
end

plot(Ttotal)