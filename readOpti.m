clear
close
clc

% import FS direcotry
path = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\OptiTrack\csvFixed';
dinfo = dir(fullfile(path, '*.csv'));

% read each file
for K = 1 : length(dinfo)
    %T = readtable('C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\OptiTrack\csvFixed\20181121 122444.csv');
    filename = fullfile(path, dinfo(K).name);
    nameS = extractAfter(filename,'csvFixed\');
    disp(nameS)
    
    T = readtable(filename);
    startTime = extractAfter(T.Properties.VariableNames(1),'x');
    startTime = strrep(startTime,'L','-');
    startTime = strrep(startTime,'S',' ');
    startTime = strrep(startTime,'D',':');
    startTime = strrep(startTime,'M','.');
    startTime = startTime{1};
    t = datetime(startTime,'InputFormat','yyyy-MM-dd HH:mm:ss.SSS');
    
    tnew = NaT(height(T),1);
    for i = 1:height(T)
        tnew(i,:) = t + seconds((T.(1)(i)));
    end
    % splitcells = regexp(startTime, ':', 'split');
    % splitcells = str2double(splitcells{1});
    % ateN = datenum(splitcells);
    
    % startTime = milliseconds(hours(startTime(4)) + minutes(startTime(5)) + seconds(startTime(6))+ milliseconds(startTime(7)));
    
    T.(1) = tnew;
    
    T.Properties.VariableNames(1) = {'TimeOpt'};
    T.TimeOpt.Format = 'yyyy-MM-dd HH:mm:ss.SSS';
    nameS = strcat(erase(nameS,'.csv'),'.mat');
    save(nameS,'T')
end