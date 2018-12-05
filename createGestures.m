% create gestures after placing manually the identificator
clc
clear
close

T = struct2cell(load('AllData.mat'));
T = T{1};
[m,n] = size(T);

flex=table; abduc=table; horizAbd=table; diagAbd=table; diagInvAbd=table; interval=table;
f=1; abd=1; ho=1; di=1; diIn=1; in=1;
for i = 1:m
    switch T.MovType(i)
        case 0
            interval(in,:) = T(i,:);
            in = in+1;
        case 1
            flex(f,:) = T(i,:);
            f = f+1;
        case 2
            abduc(abd,:) = T(i,:);
            abd = abd+1;
        case 3
            horizAbd(ho,:) = T(i,:);
            ho = ho+1;
        case 4
            diagAbd(di,:) = T(i,:);
            di = di+1;
        case 5
            diagInvAbd(diIn,:) = T(i,:);
            diIn = diIn+1;
        otherwise
            disp('No Data')
    end
end
clear('f','abd','ho','di','diIn','in','i','m','n');

save('6_interval.mat','interval')
save('1_flex.mat','flex')
save('2_abduc.mat','abduc')
save('3_horizAbd.mat','horizAbd')
save('4_diagAbd.mat','diagAbd')
save('5_diagInvAbd.mat','diagInvAbd')
