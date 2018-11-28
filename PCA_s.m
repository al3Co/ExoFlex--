load('vectorsToNN.mat');

[coeff,score,latent,tsquared,explained,mu] = pca(sensF,'VariableWeights','variance');

Xcentered = score*coeff';

%names = {'A0' 'A1' 'A2' 'A3' 'A4' 'A5' 'A6' 'A7' 'A8' 'A9'};
% h = biplot(coeff(:,1:3),'scores',score(:,1 :3),'varlabels',names);

xvalues = {'A0' 'A1' 'A2' 'A3' 'A4' 'A5' 'A6' 'A7' 'A8' 'A9'};
yvalues = {'A0' 'A1' 'A2' 'A3' 'A4' 'A5' 'A6' 'A7' 'A8' 'A9'};
h = heatmap(xvalues,yvalues,coeff);
h.Title = 'PCA coefficient sensors';
h.XLabel = 'Number of sensor';
h.YLabel = 'Number of sensor';