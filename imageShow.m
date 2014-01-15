function [ IM ] = imageShow( im )
%IMAGESHOW Show an image with frequencies and return the frequency version
% of image

grayScale = ([0:255]/255)'*[1 1 1];

figure(1)
image(real(im))
colormap(grayScale)

im = double(im);
IM = fft2(im);
IM = fftshift(IM);

logIM = log(abs(IM) + 1);
maxi = max(max(logIM));
mini = min(min(logIM));

figure(2)
image( (logIM-mini)/(maxi-mini)*255 )
colormap(grayScale)

pause
end

