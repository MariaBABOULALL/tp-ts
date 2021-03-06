function [ I ] = wiener( D, H, PB, PI )
%WIENER Applies a wiener filter on a frequencial representation of an image

W = (1./H).*(abs(H).*abs(H))./((abs(H).*abs(H))+(abs(PB).*abs(PB))./(abs(PI).*abs(PI)));
 
I = D.*W;

end

