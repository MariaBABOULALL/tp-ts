function [ PB, PI ] = noiseGetter( imref, H )
%NOISEGETTER Calculate noise from an image and a filter

PI = fft2(imref);
PI = fftshift(PI);

DR = PI.*H;

dr = ifft2(fftshift(DR));

sz = size(dr);
xMax = sz(1);
yMax = sz(2);

dq = zeros(sz);

for x=1:xMax
    for y=1:yMax
        dq(x, y) = floor(dr(x, y));
    end
end

DQ = fft2(dq);
DQ = fftshift(DQ);

PB = DQ - DR;

end

