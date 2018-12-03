% PCA gestures
clc
clear
close

global_coeff = [];
global_explained = [];

% import data
dir_FS = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\GesturesData';
dinfoFS = dir(fullfile(dir_FS, '*.mat'));

for K = 1 : length(dinfoFS)
    % load file
    filenameS = fullfile(dir_FS, dinfoFS(K).name);
    nameS = extractAfter(filenameS,'\GesturesData\');
    disp(nameS)

    gesture = struct2cell(load(filenameS));
    gesture = gesture{1};
    X = gesture(:,2:11);
    X = X';
    normA = X - min(X(:));
    normA = normA ./ max(normA(:)); % *
    X = normA';
    % Do the PCA
    [coeff,score,latent,~,explained] = pca(X);
    
    maxs = max(coeff);
    %bar(max(coeff)- min(coeff));
    %pause(5)
    global_coeff = [global_coeff; maxs];
    global_explained = [global_explained; explained'];
end

% to know which sensor left. Valor de cada sensor que representa a todas
% las pruebas
results = max(global_coeff)- min(global_coeff);
figure(1)
c = categorical({'S1','S2','S3','S4','S5','S6','S7','S8','S9','SX'});
bar(c,results)
title('PCA max. coefficients')
xlabel('Sensors positions')
ylabel('Sensivity to motions %')

figure(2)
c = categorical({'Flexion','Abduction','Hor. Abd.','Diag. Abd','Inv. Diag. Abd','Interval'});
bar(c,global_coeff)
title('PCA gesture for sensor')
legend({'S1','S2','S3','S4','S5','S6','S7','S8','S9','SX'},'NumColumns',5)
ylabel('Representation %')

figure(3)
c = categorical({'S1','S2','S3','S4','S5','S6','S7','S8','S9','SX'});
bar(c,global_coeff')
title('PCA sensor for gesture')
legend({'Flexion','Abduction','Hor. Abd.','Diag. Abd','Inv. Diag. Abd','Interval'},'NumColumns',2)
ylabel('Representation %')