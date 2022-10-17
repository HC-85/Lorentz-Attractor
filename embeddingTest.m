%Embedding parameters test
clear
TS = load("amplitude.dat");
m = 2;

for tau = 8
    eTS = embedTS(TS,tau,m);
    plot(eTS(:,1),eTS(:,2))
    drawnow
    pause(.1)
end