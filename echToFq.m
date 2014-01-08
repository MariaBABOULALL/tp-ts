function [ Te, fe ] = echToFq( N, a, b )
%ECHTOFQ Transforms echantillon parameters to frequency values

Te = (b - a)/N;
fe = 1/Te;

end

