%% Transmission par modulation d'amplitude

% Echantillonage
N = 16384;
a = -50;
b = 50;

% Fonctions
[ Te, fe ] = echToFq(N, a, b);

% Porteuse
fi = 128;

for n=1:N
    % Discretisation
    t = (n - 1) * Te + a;
    
    % Signal
    s(n) = 0;
    for i=1:4
        s(n) = s(n) + i*cos(2*pi*i*t);
    end
    
    % Signal 2
    s2(n) = 0;
    for i=1:8
        s2(n) = s2(n) + (5 - i)*cos(2*pi*i*t);
    end
    
    % Modulation
    c(n) = s(n)*cos(2*pi*fi*t) + s2(n)*cos(2*pi*2*fi*t);
    
    % Démodulation
    sd(n) = c(n)*cos(2*pi*fi*t);
    
    % Démodulation 2
    sd2(n) = c(n)*cos(2*pi*2*fi*t);
end

% figure(1)
% plotFreq(real(tfour(s)), N, a, b)
% title('Signal d entrée s')
% 
% figure(2)
% plotFreq(real(tfour(s2)), N, a, b)
% title('Signal d entrée s2')
% 
% figure(3)
% plotFreq(real(tfour(c)), N, a, b)
% title('Signal modulé')
% 
% figure(4)
% plotFreq(real(tfour(sd)), N, a, b)
% title('Signal démodulé sd')
% 
% figure(5)
% plotFreq(real(tfour(sd2)), N, a, b)
% title('Signal démodulé sd2')
%
% pause

%% Restauration d'images par filtre de Wiener

% Input
[ im, ~ ] = imread('assets/imageFloue.png');
D = imageShow(im);

% Filter
H = correctionH(19);

% Noise
[ imref, ~ ] = imread('assets/imageRef.png');
[ PB, PI ] = noiseGetter( imref, H );

% Simple - Doesn't work => Noise !
% I = D./H;
% imageShow(ifft2(fftshift(I)));

% Wiener
I = wiener(D, H, PB, PI);
imageShow(ifft2(fftshift(I)));