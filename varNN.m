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
%
input1 = sensF;             target1 = opArm; 
input2 = sensF;             target2 = imuArmQ; 
input3 = opArm;             target3 = imuArmQ; 
input4 = [sensF, imuArmQ];  target4 = opArm; 

input5 = sensF;             target5 = [opArm, imuArmQ]; 
input6 = sensF;             target6 = dvKoM;

input7 = imuArmQ;           target7 = dvKoM; 
input8 = opArm;             target8 = dvKoM; 

input9 = PCAsens;           target9 = imuArmQ; 
input10 = PCAsens;          target10 = opArm; 
input11 = PCAsens;          target11 = [opArm, imuArmQ];
input12 = PCAsens;          target12 = dvKoM;





