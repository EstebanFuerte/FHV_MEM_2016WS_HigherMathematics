function [ f,g ] = fct1( x )
    f = exp(x) - exp(-x);
    g = exp(x) + exp(-x);
end

