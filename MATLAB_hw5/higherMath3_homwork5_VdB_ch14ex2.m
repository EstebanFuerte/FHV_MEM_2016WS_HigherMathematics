% Author: Stefan Stark
% Date:   29.11.2016

%% clean up
clear all, close all, clc;

% VdB Excercise 14.2 (page 181)
% A hybrid of the bisection method and Newtons method

%% load data
[n,w,d,D,L] = ch8ex4;     % 5 vectors with length 50

%% define A-Matrix and b Vector:
A(50,5) = zeros;    % define A matrix
b(50,1) = zeros;    % define b vector

A(:,1) = ones;
A(:,2) = log(n);
A(:,3) = log(w);
A(:,4) = log(d);
A(:,5) = log(D);
b = log(L(:));

%% Solution on non-linear least squares problem
x = [-7.25 1.38 -0.48 0.28 1.21]';
%x = zeros(5,1);

% -- Step 1 - Calculate gradient and hessian ------------------------------
% g(x) = |Ax-b|^2 = ...
% g(x) = x'*A'*A*x- 2*b'*A*x + b'b
G = 2*A'*A*x-2*A'*b;    % Gradient
H = 2*A'*A;             % Hessian
j = 0;
i = 1;
% -- Step 2 - Check if gradient is smaller than error ---------------------
while (norm(G) > 10e-5)
	% -- Step 3 - calculate stepwith --------------------------------------
    v = inv(H)*(-G);
    v = H\(-G);
    
    % -- Step 4
    tk(i) = 1/2^j;
    x1 = x + tk(i).*v;
    g = exp(x(1)) .* n.^x(2) .* w.^x(3) .* d.^x(4) .* D.^x(5) - L;
	g_neu = exp(x1(1)) .* n.^x1(2) .* w.^x1(3) .* d.^x1(4) .* D.^x1(5) - L;
    %disp(norm(g_neu)); disp(norm(g));
    
    if (norm(g_neu) < norm(g))
        x = x + 1/2^j .* v;
        G = 2*A'*A*x-2*A'*b;    % Gradient
        H = 2*A'*A;             % Hessian
        j = 0;
    else
        j=j+1;
    end
    i = i+1;
	%disp(norm(G));          % debugging
%     L_hat = exp(x(1)) .* n.^x(2) .* w.^x(3) .* d.^x(4) .* D.^x(5);
%     ei = (L-L_hat);
%     e = sum(ei)
end