function [ ] = multiplot( name, x, N, a, b )
X = tfour(x);

figure(1)
plotTime(x, N, a, b)
title(name)

figure(2)
plotTime(tfourinv(X), N, a, b)
title('après passage fourrier et fourrier inverse')

figure(3)
plotFreq(real(X), N, a, b)
title('spectre reel')

figure(4)
plotFreq(imag(X), N, a, b)
title('spectre imaginaire')

pause

end

