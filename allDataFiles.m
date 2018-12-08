% read all mat

clear
close
clc

% import data
dir_FS = '/Users/aldo/Documents/OneDrive - Universidad Politécnica de Madrid/ExoFlex/Publications/Access/Tests/dataAcquired/test2/AllMatched';
dinfoFS = dir(fullfile(dir_FS, '*.mat'));
Tt = table;
for K = 1 : length(dinfoFS)
    disp(K)
    % 
    filenameS = fullfile(dir_FS, dinfoFS(K).name);
    nameS = extractAfter(filenameS,'\AllMatched\');
    disp(nameS)
    
    T_s = struct2cell(load(filenameS));
    T_s = T_s{1};
    
    Tt = [Tt; T_s];
end
save('AllData.mat','Tt')