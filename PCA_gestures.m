% PCA gestures
clc
clear
close

load('vectorsToNN.mat');

[coeff,score,latent,tsquared,explained,mu] = pca(m_abduc(:,2:11),'VariableWeights','variance');

Xcentered = score*coeff';


X = m_abduc(:,2:11);
X = X';
normA = X - min(X(:));
normA = normA ./ max(normA(:)); % *
X = normA';
% Do the PCA
[coeff,score,latent,~,explained] = pca(X);
% Calculate eigenvalues and eigenvectors of the covariance matrix
covarianceMatrix = cov(X);;
[V,D] = eig(covarianceMatrix);
% "coeff" are the principal component vectors. These are the eigenvectors of the covariance matrix. Compare ...
% coeff;
% V
% Multiply the original data by the principal component vectors to get the projections of the original data on the
% principal component vector space. This is also the output "score". Compare ...
dataInPrincipalComponentSpace = X*coeff;
score
% The columns of X*coeff are orthogonal to each other. This is shown with ...
corrcoef(dataInPrincipalComponentSpace);
% The variances of these vectors are the eigenvalues of the covariance matrix, and are also the output "latent". Compare
% these three outputs
% var(dataInPrincipalComponentSpace)'
% latent
% sort(diag(D),'descend')


xvalues = {'S1' 'S2' 'S3' 'S4' 'S5' 'S6' 'S7' 'S8' 'S9', 'S10'};
yvalues = {'S1' 'S2' 'S3' 'S4' 'S5' 'S6' 'S7' 'S8' 'S9', 'S10'};
h = heatmap(dataInPrincipalComponentSpace);
h.Title = 'PCA coefficient sensors';
h.XLabel = 'Number of sensor';
h.YLabel = 'Number of sensor';

c = categorical({'S1' 'S2' 'S3' 'S4' 'S5' 'S6' 'S7' 'S8' 'S9', 'S10'});
bar(c, coeff(1:3, :)')