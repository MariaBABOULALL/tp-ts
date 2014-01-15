function [ H ] = correctionH( he )
%CORRECTIONH creates a filter able to correct blur in an image

h = zeros(512, 512);

for x=256:258
    for y=257-floor(he/2):257+round(he/2)
        h(y, x) = 1/(3*he);
    end
end

H = fft2(h);
H = fftshift(H);

end

