% variables for NN
clear
close
clc

load('/Users/aldo/Documents/OneDrive - Universidad Politécnica de Madrid/ExoFlex/Publications/Access/Tests/dataAcquired/test2/AllData.mat')

sensF = [Tt.S1,Tt.S2,Tt.S3,Tt.S4,Tt.S5,Tt.S6,Tt.S7,Tt.S8,Tt.S9,Tt.S10];
kOm = [Tt.MovType]; kOm(kOm==0)=6;
dvKoM = dummyvar(kOm);
imuArmQ = [Tt.QArm1,Tt.QArm2,Tt.QArm3,Tt.QArm4];
imuArmE = [Tt.EuArm1,Tt.EuArm2,Tt.EuArm3];
opArm = [Tt.ArmPosX,Tt.ArmPosY,Tt.ArmPosZ];

PCAsens = [Tt.S2,Tt.S3,Tt.S4,Tt.S5,Tt.S7,Tt.S8,Tt.S9];

PCAsens2 = [Tt.S2,Tt.S3,Tt.S4,Tt.S5,Tt.S7,Tt.S8,Tt.S10];

PCAsensE = [Tt.S2,Tt.S3,Tt.S5,Tt.S7,Tt.S8];
PCAsensF = [Tt.S2,Tt.S7,Tt.S10];

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

input1 = PCAsens2;          target1 = imuArmQ; 
input2 = PCAsens2;          target2 = opArm; 
input3 = PCAsens2;          target3 = [opArm, imuArmQ];
input4 = PCAsens2;          target4 = dvKoM;
input5 =[PCAsens2,imuArmQ]; target5 = opArm;

input6 =[PCAsensE,imuArmQ]; target6 = opArm; 
input7 =[PCAsensF,imuArmQ]; target7 = opArm;

save('input1.mat','input1'); save('target1.mat','target1');
save('input2.mat','input2'); save('target2.mat','target2');
save('input3.mat','input3'); save('target3.mat','target3');
save('input4.mat','input4'); save('target4.mat','target4');
save('input5.mat','input5'); save('target5.mat','target5');
save('input6.mat','input6'); save('target6.mat','target6');
save('input7.mat','input7'); save('target7.mat','target7');


