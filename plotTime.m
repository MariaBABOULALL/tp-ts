function [ ] = plotTime( f, N, a, b )
%PLOTTIME Plot a function on time

[ Te, ~ ] = echToFq(N, a, b);

x = a:Te:(b - Te);
X = 1:N;
y = f(X);

figure(1)
plot(x,y)

end

