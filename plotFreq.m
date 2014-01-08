function [ ] = plotFreq( F, N, a, b )
%PLOTFREQ Plot function on frequencies

[ ~, fe ] = echToFq(N, a, b);

df = fe/N;

x = -fe/2:df:(fe/2 -df);
X = 1:N;
y = F(X);

figure(1)
plot(x,y)

end

