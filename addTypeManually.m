clear
close
clc

T = readtable('20181126-100941A.txt');
sens = [T.Var3, T.Var4, T.Var5, T.Var6, T.Var7, T.Var8, T.Var9, T.Var10, T.Var11, T.Var12];
sens = sgolayfilt(sens,3,41);
plot(sens)

A1 = 1755;  % inicio 1/ fin vacio1
A2 = 10990; % inicio vacio 2 / 
A3 = 12520; % inicio 2
A4 = 21160; % inicio vacio 3 
A5 = 22220;% inicio 3
A6 = 29930;% inicio vacio 4
A7 = 31020;% inicio 4
A8 = 38410;% inicio vacio 5
A9 = 40410;% inicio 5
A10 =47500;% inicio 5

mov = zeros(size(sens,1),1);
mov(1:A1,    1) = 0;   % void data
mov(A1+1:A2, 1) = 1;   % abduction
mov(A2+1:A3,1) = 0;   % void data
mov(A3+1:A4,1)= 2;   % flexion
mov(A4+1:A5,1)= 0;   % void data
mov(A5+1:A6,1)= 3;   % hor Abd
mov(A6+1:A7,1)= 0;   % void data
mov(A7+1:A8,1)= 4;   % diag abd
mov(A8+1:A9,1)= 0;   % void data
mov(A9+1:A10,1)= 5;   % inv diag abd
mov(A10+1:end,1)  = 0;   % void data

sens = num2cell(sens);
T(:,3:12) = sens;
T2 = table(mov);
T = [T, T2];
varNames = {'Count','Time','S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','MovType'};
T.Properties.VariableNames = varNames;
clear('mov','sens','T2','varNames');
clear('A1','A2','A3','A4','A5','A6','A7','A8','A9','A10');


