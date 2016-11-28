%% clean up
clear all, close all, clc;

% VdB Excercise 8.4 (page 125)


%% load data
[n,w,d,D,L] = ch8ex4;   % 5 vectors with length 50

%% formulate A and b for linear least square
% Li_hat = alpha*ni^beta1 * wi^beta2 * di^beta3 * Di^beta4
% log(Li_hat) = log(alpha*ni^beta1 * wi^beta2 * di^beta3 * Di^beta4)
% log(Li_hat) = 
% log(alpha)+log(ni^beta1)+log(wi^beta2)+log(di^beta3)+log(Di^beta4)
% log(Li_hat) = 
% log(alpha)+beta1*log(ni)+beta2*log(wi)+beta3*log(di)+beta4*log(Di)

% x1 = log(alpha); x2= beta1; x3 = beta2; x4 = beta3; x5=beta5
% bx = a1 * x1 + a2*x2 + a3*x3 +a4*x4 +a5*x5

A(50,5) = zeros;    % define A matrix
b(50,1) = zeros;    % define b vector

A(:,1) = ones;
A(:,2) = log(n);
A(:,3) = log(w);
A(:,4) = log(d);
A(:,5) = log(D);
b = log(L(:));

x_hat = A\b;

% log(alpha) = x1 -> alpha = exp(x1)
alpha = exp(x_hat(1));
L_hat = alpha*n.^x_hat(2).*w.^x_hat(3).*d.^x_hat(4).*D.^x_hat(5);

ei = 100 * abs(L_hat-L)/L;
av = sum(ei)/50;
figure; plot(av,'o'); 
title('average percantage error of the 50 inductors');
xlabel('Inductor sample');
ylabel('Average percantage error');