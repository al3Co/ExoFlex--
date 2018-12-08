% variables for NN
clear
close
clc

load('AllData.mat')

sensF = [Tt.S1,Tt.S2,Tt.S3,Tt.S4,Tt.S5,Tt.S6,Tt.S7,Tt.S8,Tt.S9,Tt.S10];
kOm = [Tt.MovType]; kOm(kOm==0)=6;
dvKoM = dummyvar(kOm);
imuArmQ = [Tt.QArm1,Tt.QArm2,Tt.QArm3,Tt.QArm4];
imuArmE = [Tt.EuArm1,Tt.EuArm2,Tt.EuArm3];
opArm = [Tt.ArmPosX,Tt.ArmPosY,Tt.ArmPosZ];
PCAsens = [Tt.S2,Tt.S3,Tt.S4,Tt.S5,Tt.S7,Tt.S8,Tt.S9];
PCAsensA = [Tt.S3,Tt.S4,Tt.S5,Tt.S7,Tt.S10];
PCAsensB = [Tt.S2,Tt.S5,Tt.S7,Tt.S10];

%
% input1 = sensF;             target1 = opArm; 
% input2 = sensF;             target2 = imuArmQ; 
% input3 = opArm;             target3 = imuArmQ; 
% input4 = [sensF, imuArmQ];  target4 = opArm; 
% 
% input5 = sensF;             target5 = [opArm, imuArmQ]; 
% input6 = sensF;             target6 = dvKoM;
% 
% input7 = imuArmQ;           target7 = dvKoM; 
% input8 = opArm;             target8 = dvKoM; 
% 
% input9 = PCAsens;           target9 = imuArmQ; 
% input10 = PCAsens;          target10 = opArm; 
% input11 = PCAsens;          target11 = [opArm, imuArmQ];
% input12 = PCAsens;          target12 = dvKoM;

% save('input1.mat','input1'); save('target1.mat','target1'); 
% save('input2.mat','input2'); save('target2.mat','target2'); 
% save('input3.mat','input3'); save('target3.mat','target3'); 
% save('input4.mat','input4'); save('target4.mat','target4'); 
% save('input5.mat','input5'); save('target5.mat','target5'); 
% save('input6.mat','input6'); save('target6.mat','target6'); 
% save('input7.mat','input7'); save('target7.mat','target7'); 
% save('input8.mat','input8'); save('target8.mat','target8'); 
% save('input9.mat','input9'); save('target9.mat','target9'); 
% save('input10.mat','input10'); save('target10.mat','target10'); 
% save('input11.mat','input11'); save('target11.mat','target11'); 
% save('input12.mat','input12'); save('target12.mat','target12');

inputX3 = PCAsens;          targetX3 = imuArmQ; 
inputX4 = PCAsens;          targetX4 = opArm; 
inputX5 = PCAsens;          targetX5 = [opArm, imuArmQ];
inputX6 = PCAsens;          targetX6 = dvKoM;

inputX7 = PCAsens;          targetX7 = imuArmQ; 
inputX8 = PCAsens;          targetX8 = opArm; 
inputX9 = PCAsens;          targetX9 = [opArm, imuArmQ];
inputXX = PCAsens;         targetXX = dvKoM;

save('inputX3.mat','inputX3'); save('targetX3.mat','targetX3');
save('inputX4.mat','inputX4'); save('targetX4.mat','targetX4');
save('inputX5.mat','inputX5'); save('targetX5.mat','targetX5');
save('inputX6.mat','inputX6'); save('targetX6.mat','targetX6');

save('inputX7.mat','inputX7'); save('targetX7.mat','targetX7');
save('inputX8.mat','inputX8'); save('targetX8.mat','targetX8');
save('inputX9.mat','inputX9'); save('targetX9.mat','targetX9');
save('inputXx.mat','inputXX'); save('targetXX.mat','targetXX');

