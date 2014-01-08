function [ ] = plotFreq( F, fe )
%PLOTFREQ Plot function on frequencies

x = -fe/2:fe/2;
y = F(x);

plot(x,y);

end

