function [ ] = plotTime( f, a, b )
%PLOTTIME Plot a function on time

x = a:b;
y = f(x);

plot(x,y);

end

