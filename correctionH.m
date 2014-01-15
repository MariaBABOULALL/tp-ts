function [ H ] = correctionH( L, He, l, he )
%CORRECTIONH creates a filter able to correct blur in an image

h = zeros(L, He);

for x=floor(L/2 - l/2):floor(L/2 + l/2)
    for y=floor(He/2 - he/2):floor(He/2 + he/2)
        h(y, x) = 1/(l*he);
    end
end

H = fft2(h);
H = fftshift(H);

end

