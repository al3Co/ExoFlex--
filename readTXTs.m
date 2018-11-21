clear
close
clc

Ttotal = [];
% import data direcotry
dir_to_search = 'C:\Users\disam\Documents\OneDrive_AldoContreras\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\FlexSens';
txtpattern = fullfile(dir_to_search, '*.txt');
dinfo = dir(txtpattern);

for K = 1 : length(dinfo)
    filename = fullfile(dir_to_search, dinfo(K).name);  %just the name
    disp(filename)
    T = readtable(filename);
    sens = [T.Var3, T.Var4, T.Var5, T.Var6, T.Var7, T.Var8, T.Var9, T.Var10, T.Var11, T.Var12];
    Ttotal = [Ttotal; sens];
    plot(sens)
    pause(1)
end

plot(Ttotal)