%% Enonc�
% Echantillonage
N = 16384;
a = -50;
b = 50;

% Param�tres fonctions
K = 1;
fq = 1.0045; % On choisit de sorte � avoir un nombre non entier de p�riodes entre a et b
dt = 3;

% Fonctions
[ Te, fe ] = echToFq(N, a, b);

four = floor(N*0.4/(b - a));
i = 1;
top = true;

for n=1:N
    % Discretisation
    t = (n - 1) * Te + a;
    x0(n) = K;
    x1(n) = cos(2*pi*fq*t);
    x2(n) = sin(2*pi*fq*t);
    if n == floor((dt-a)/Te +1)
        x3(n) = 1;
    else
        x3(n) = 0;
    end
    x4(n) = exp(1i*2*pi*fq*t);
    if t >= 0 && t <= 0.4
        x5(n) = 1;
    else
        x5(n) = 0;
    end
    
    if i < four && top
        x5p(n) = 1;
        i = i + 1;
    elseif i < four
        x5p(n) = 0;
        i = i + 1;
    else
        i = 1;
        top = ~top;
    end
        
    
    x6(n) = exp(-pi*t*t);
end

%% Frequence

'Quelle est la p�riode d �chantillonage ?'
Te

'Quelle est la fr�quence d �chantillonnage ?'
fe

%% Transform�es

'Affichez ces fonctions ainsi que leurs spectres'

multiplot('Constante x0', x0, N, a, b)

multiplot('Cosinus P�riodiquex1', x1, N, a, b)

multiplot('Sinus P�riodique x2', x2, N, a, b)
'En utilisant un nombre non entier de p�riodes entre a et b (fq=3.0045 par ex.), les diracs sont remplac�s par des sinus cardinaux'

multiplot('Dirac x3', x3, N, a, b)

multiplot('Exponentielle x4', x4, N, a, b)

multiplot('Rectangle x5', x5, N, a, b)

multiplot('Rectangle P�riodique x5p', x5p, N, a, b)

multiplot('Gaussienne x6', x6, N, a, b)

%% Echantillonage et aliasing

g50 = gFunction(50, N, a, b);
g120 = gFunction(120, N, a, b);

figure(1)
plotFreq(imag(tfour(g50)), N, a, b)
title('Non Alias�e g50')

figure(2)
plotFreq(imag(tfour(g120)), N, a, b)
title('Alias�e g120')
'Repliement de spectre'
'Non respect du th�or�me de shannon fe(=163) > 2*fMax(=120)'

gsin = gFunction(156.34, N, a, b);
figure(3)
plotFreq(imag(tfour(gsin)), N, a, b)
title('Alias�e gsin')
'On exag�re le repliement spectral pour rapprocher les diracs et obtenir un sinus simple'
