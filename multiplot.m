function [ ] = multiplot( name, x, N, a, b )

name

X = tfour(x);

'  temporel'
plotTime(x, N, a, b)
pause
'  spectre reel'
plotFreq(real(X), N, a, b)
pause
'  spectre imaginaire'
plotFreq(imag(X), N, a, b)
pause

end

