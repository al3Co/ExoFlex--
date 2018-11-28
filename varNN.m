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

%
input1 = opArm; target1 = sensF;
input2 = imuArmQ; target2 = sensF;
input3 = imuArmQ; target3 = opArm;
input4 = opArm; target4 = [sensF, imuArmQ];

input5 = sensF; target5 = dvKoM;
input6 = [opArm, imuArmQ]; target6 = sensF;




