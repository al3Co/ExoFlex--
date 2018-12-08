% PCA gestures
clc
clear
close

global_coeff = [];
global_explained = [];

plot = true;
% import data
dir_FS = '/Users/aldo/Documents/OneDrive - Universidad Politécnica de Madrid/ExoFlex/Publications/Access/Tests/dataAcquired/test1/GesturesData';
dinfoFS = dir(fullfile(dir_FS, '*.mat'));

for K = 1 : length(dinfoFS)
    % load file
    filenameS = fullfile(dir_FS, dinfoFS(K).name);
    nameS = extractAfter(filenameS,'/GesturesData/');
    disp(nameS)

    gesture = struct2cell(load(filenameS));
    gesture = gesture{1};
    
    X = normalize(gesture(:,3:12),'range');
    if istable(X)
        X = table2array(X);
    end
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

% PCA for gesture
global_coeffExt = global_coeff(:,1:5);
global_coeffInt = global_coeff(:,6:10);
[m,n] = size(global_coeffExt);
for i = 1:m
    for j = 1:n
        pca_forGestureExt(i,j) = (global_coeffExt(i,j) /sum(global_coeffExt(i,:)));
        pca_forGestureInt(i,j) = (global_coeffInt(i,j) /sum(global_coeffInt(i,:)));
    end
end

clear('i','j','K','m','n')
pca_forGestureExt(6,:) = [];
pca_forGestureInt(6,:) = [];

colormap default

if plot
    figure(1)
    c = categorical({'S1','S2','S3','S4','S5','S6','S7','S8','S9','SX'});
    bar(c,results)
    title('PCA max. coefficients')
    xlabel('Sensors positions')
    ylabel('Sensitivity to motions %')

    figure(2)
    c = categorical({'Flexion','Abduction','Horizontal Abduction','Open drill','Closing drill','Interval'});
    bar(c,global_coeff)
    title('PCA gesture for sensor')
    legend({'S1','S2','S3','S4','S5','S6','S7','S8','S9','SX'},'NumColumns',5)
    ylabel('Representation %')

    figure(3)
    c = categorical({'S1','S2','S3','S4','S5','S6','S7','S8','S9','SX'});
    bar(c,global_coeff')
    title('PCA sensor for gesture')
    legend({'Flexion','Abduction','Horizontal Abduction','Open drill','Closing drill','Interval'},'NumColumns',2)
    ylabel('Representation %')
    
    figure(4)
    subplot(2,1,1);
    c = categorical({'1','2','3','4','5'});
    bar(c,pca_forGestureExt')
    title('Internal Side','FontSize',15)
    legend({'Flexion','Abduction','Horizontal Abduction','Open drill','Closing drill'},'NumColumns',3,'Location','southoutside','FontSize',15)
    ylabel('Sensitivity to motions %','FontSize',15)

    subplot(2,1,2);
    c = categorical({'6','7','8','9','X'});
    bar(c,pca_forGestureInt')
    title('External Side','FontSize',15)
    legend({'Flexion','Abduction','Horizontal Abduction','Open drill','Closing drill'},'NumColumns',3,'Location','southoutside','FontSize',15)
    ylabel('Sensivity to motions %','FontSize',15)
end


