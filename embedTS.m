function eTS = embedTS(TS,tau,m)
%evenly spaced by dt
%tau is the embedding delay
%m is the embedding dimension

comb = 1:tau:tau*m;
eTS = zeros(length(TS) - tau*(m-1), m); 
for n = 1:length(eTS)
    eTS(n,:) = TS(comb + n - 1);
end