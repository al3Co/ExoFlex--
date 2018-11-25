clear
close
clc

Ttotal = [];
% import data direcotry
dir_to_search = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\FlexSens';
txtpattern = fullfile(dir_to_search, '*.mat');
dinfo = dir(txtpattern);

% read each file
for K = 1 : length(dinfo)
    filename = fullfile(dir_to_search, dinfo(K).name);  %just the name
    disp(filename)
    T = struct2cell(load(filename));
    T = T{1};
    sens = [T.S1, T.S2, T.S3, T.S4, T.S5, T.S6, T.S7, T.S8, T.S9, T.S10];
    Ttotal = [Ttotal; sens];
    plot(sens)
    pause(2)
end

plot(Ttotal)