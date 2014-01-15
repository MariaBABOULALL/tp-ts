function [ PB, PI ] = noiseGetter( imref, H )
%NOISEGETTER Calculate noise from an image and a filter

PI = fft2(imref);
PI = fftshift(PI);

DR = PI.*H;

dr = double(ifft2(fftshift(DR)));

dq = floor(dr);

pb = dr - dq;

PB = fft2(pb);
PB = fftshift(PB);

end

