% variables for NN
clear
close
clc

load('C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\AllData.mat')

sensF = [Tt.S1,Tt.S2,Tt.S3,Tt.S4,Tt.S5,Tt.S6,Tt.S7,Tt.S8,Tt.S9,Tt.S10];
kOm = [Tt.MovType]; kOm(kOm==0)=6;
dvKoM = dummyvar(kOm);
imuArmQ = [Tt.QArm1,Tt.QArm2,Tt.QArm3,Tt.QArm4];
imuArmE = [Tt.EuArm1,Tt.EuArm2,Tt.EuArm3];
opArm = [Tt.ArmPosX,Tt.ArmPosY,Tt.ArmPosZ];
PCAsens = [Tt.S2,Tt.S3,Tt.S4,Tt.S5,Tt.S7,Tt.S8,Tt.S9];
%
target1 = opArm; input1 = sensF;
target2 = imuArmQ; input2 = sensF;
target3 = imuArmQ; input3 = opArm;
target4 = opArm; input4 = [sensF, imuArmQ];

target5 = sensF; input5 = dvKoM;
target6 = [opArm, imuArmQ]; input6 = sensF;

target7 = imuArmQ; input7 = dvKoM;
target8 = opArm; input8 = dvKoM;

target9 = imuArmQ; input9 = PCAsens;
target10 = opArm; input10 = PCAsens;
target11 = [opArm, imuArmQ]; input11 = PCAsens;





