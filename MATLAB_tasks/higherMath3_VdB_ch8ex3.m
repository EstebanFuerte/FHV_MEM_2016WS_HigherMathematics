% FHV - Master in Meachatronics - Sem 3 
% Higher Mathemtaics III
%
% Author:       Stefan Stark
% Date:         30.09.2016
% Description:  Examples with Linear Least Square;
%               Script VdB - exercise 8.3 (page 124)       

clear all, close all, clc;


%% load data
[t,n] = data_ch8ex3;

%% plot data
figure; semilogy(t,n,'o');

%% lecturer notes
% n(t) = alpha^(t-t0)   alpha, t0 unknown
% equations are not linear
% setting must be transformed to a set of linear equations

%% formulate A and b for linear least sqarte
% 2250 = alpha^(1972-t0)
% log(2250) = (1972-t0)*log(alpha)
% log(2250) = 1972*log(alpha)-t0*log(alpha)
%    with log(alpha)    = x1
%    with t0*log(alpha) = x2
% => bx = a11 * x1 + a22 * x2

A(13,2)= zeros;     % define A matrix
b(13,1)= zeros;
A(:,2)=-1;          % 2nd col to -1
A(:,1) = t;

b = log(n(:));
x_hat = A\b;

% log(alpha) = x1 -> alpha = exp(x1)
alpha = exp(x_hat(1));
% t0*log(alpha) = x2 -> t0 = x2/log(alpha) = x2/x1
t0 = x_hat(2)/x_hat(1);

n_hat = alpha.^(t-t0);
% plot in same figure
hold on; semilogy(t,n_hat,'+'); 
legend('original data', 'linear least sqare');

%% check if moores Law holds or not.
% (n(t+2))/(n(t) = 2
% (alpha^(t+2-t0))/alpha^(t-t0) = alpha^2
alpha_square = alpha^2  % res: 2.0325
n_2016 = alpha^(2016-t0)
 
