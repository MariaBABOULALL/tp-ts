function [ g ] = gFunction( f, N, a, b )

df = 5;

[ Te, ~ ] = echToFq(N, a, b);

for n=1:N
    % Discretisation
    t = (n - 1) * Te + a;
    
    g(n) = -sin(2*pi*f*t) +sin(2*pi*(f + df)* t) +sin(2*pi*(f + 2*df)* t);
end
end

