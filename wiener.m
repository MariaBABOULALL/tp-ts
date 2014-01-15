function [ I ] = wiener( D, H, PB, PI )
%WIENER Applies a wiener filter on a frequencial representation of an image

sz = size(H);
uMax = sz(1);
vMax = sz(2);

W = zeros(uMax, vMax);

for u=1:uMax
    for v=1:vMax
        W(u, v) = abs(H(u,v)*H(u,v))/(H(u,v)*(abs(H(u,v)*H(u,v))+PB(u,v)/PI(u,v)));
    end
end

I = D.*W;

end

