%% Enonc�
% Echantillonage
N = 16384;
a = -50;
b = 50;

% Param�tres fonctions
K = 1;
fq = 2;

% Fonctions
xa0(t) = K;
xa1(t) = cos(2*pi*fq*t);
xa2(t) = sin(2*pi*fq*t);
% x3(t) = dirac(t-dt); % � echantillonner � la main
xa4(t) = exp(1i*2*pi*fq*t);
% xa5(t) = ???
xa6(t) = exp(-pi*t*t);

%% Frequence

[ Te, fe ] = echToFq(N, a, b);

'Quelle est la p�riode d �chantillonage ?'
Te

'Quelle est la fr�quence d �chantillonnage ?'
fe

%% Echantillonage

'Affichez ces fonctions ainsi que leurs spectres'

