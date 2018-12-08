% test RNN

load('/Users/aldo/Documents/OneDrive - Universidad Politécnica de Madrid/ExoFlex/Publications/Access/Tests/dataAcquired/test2/NNs/Input/inputE3.mat')
load('/Users/aldo/Documents/OneDrive - Universidad Politécnica de Madrid/ExoFlex/Publications/Access/Tests/dataAcquired/test2/NNs/Target/targetE2.mat')
X = input11;
T = target10;


%[X,T] = simpleseries_dataset;

X = tonndata(X,false,false);
T = tonndata(T,false,false);

net = layrecnet(1:2,10);
[Xs,Xi,Ai,Ts] = preparets(net,X,T);
net = train(net,Xs,Ts,Xi,Ai);
view(net)
Y = net(Xs,Xi,Ai);
perf = perform(net,Y,Ts);
