%% Enoncé
% Echantillonage
N = 16384;
a = -50;
b = 50;

% Paramètres fonctions
K = 1;
fq = 2;
dt = 3;

% Fonctions
[ Te, fe ] = echToFq(N, a, b);

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
    if t >= 0 && t <= 4
        x5(n) = 1;
    else
        x5(n) = 0;
    end
    x6(n) = exp(-pi*t*t);
end

%% Frequence

'Quelle est la période d échantillonage ?'
Te

'Quelle est la fréquence d échantillonnage ?'
fe

%% Transformées

'Affichez ces fonctions ainsi que leurs spectres'

multiplot('x0', x0, N, a, b)
multiplot('x1', x1, N, a, b)
multiplot('x2', x2, N, a, b)
multiplot('x3', x3, N, a, b)
multiplot('x4', x4, N, a, b)
multiplot('x5', x5, N, a, b)
multiplot('x6', x6, N, a, b)