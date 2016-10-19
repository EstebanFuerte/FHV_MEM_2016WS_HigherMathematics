% FHV - Master in Meachatronics - Sem 3 
% Higher Mathemtaics III
%
% Author:       Stefan Stark
% Date:         19.10.2016
% Description:  Least-squares model fitting;
%               Script VdB - exercise 8.7 (page 124)       


%%
clear all, close all, clc;


%% load data & plot them
[u,y] = ch8ex7;
N = length(u);      % length of the input vector for further calculations
t = linspace(1,N);

%% general steps
% 1. Define A matrix
%     y = beta * u
%     one variable (beta) -> 1 col Array for A
%     independent from u so the col values are 1
% 2. split coefficients out of A
% 3. Compute y_hat
% 4. compute resdiual and RMS of resdiual
% 5. show solutions


%% a) constant model: y(t) = alpha
A(1:N,1) = 1;
x_hat = A\y;
beta = x_hat;
y_hat(1:N) = beta;
[resu,rRMS] = resdiualRMS(y,y_hat);
generatePlots(t,y,y_hat,rRMS);

%% b) static linear: y(t) = beta*u(t)
A(1:N,1) = u;
x_hat = A\y;
beta = x_hat;
y_hat = beta*u;
[resu,rRMS] = resdiualRMS(y,y_hat);
generatePlots(t,y,y_hat,rRMS);

%% c) static affine: y(t) = alpha + beta*u(t)
A(1:N,1) = 1;
A(1:N,2) = u;
x_hat = A\y;    % coefficients
alpha = x_hat(1);
beta = x_hat(2);
y_hat = alpha + beta*u;
[resu,rRMS] = resdiualRMS(y,y_hat);
generatePlots(t,y,y_hat,rRMS);


%% d) static quadratic: y(t)=alpha+beta*u(t)+gamma*u(t)^2 
A(1:N,1) = 1;
A(1:N,2) = u;
A(1:N,3) = u.*u;
x_hat = A\y; 
alpha = x_hat(1);
beta = x_hat(2);
gamma = x_hat(3);
y_hat = alpha+beta*u+gamma*u.^2;
[resu,rRMS] = resdiualRMS(y,y_hat);
generatePlots(t,y,y_hat,rRMS);

%% e) linear, 2-tap: y(t)=beta1*u(t)+beta2*u(t-1)
clear A; clear x_hat;
A(1:N-1,1) = u(2:N);
A(1:N-1,2) = u(1:N-1);
x_hat = A\y(2:N);
beta1 = x_hat(1);
beta2 = x_hat(2);
y_hat = beta1*u(2:N)+beta2*u(1:N-1);
[resu,rRMS] = resdiualRMS(y(2:N),y_hat);
generatePlots(t(1:N-1),y(2:N),y_hat,rRMS);

%% f) affine, 2-tap: y(t)= alpha+beta1*u(t)+beta2*u(t-1)
clear A x_hat alpha beta1 beta2;
A(1:N-1,1) = 1;
A(1:N-1,2) = u(2:N);
A(1:N-1,3) = u(1:N-1);
x_hat = A\y(2:N);
alpha = x_hat(1);
beta1 = x_hat(2);
beta2 = x_hat(3);
y_hat = alpha + beta1*u(2:N)+beta2*u(1:N-1);
[resu,rRMS] = resdiualRMS(y(2:N),y_hat);
generatePlots(t(1:N-1),y(2:N),y_hat,rRMS);

%% g) quadratic, 2-tap: 
% y(t)=alpha+beta1*u(t)+gamma1*u(t)^2+beta2*u(t-1)+gamma2*u(t-1)^2+delta*u(t)*u(t-1)
clear A x_hat alpha beta1 beta2;
A(1:N-1,1) = 1;
A(1:N-1,2) = u(2:N);
A(1:N-1,3) = u(2:N).*u(2:N);
A(1:N-1,4) = u(1:N-1);
A(1:N-1,5) = u(1:N-1).^2;
A(1:N-1,6) = u(2:N).*u(1:N-1);

x_hat = A\y(2:N);

alpha = x_hat(1);
beta1 = x_hat(2);
gamma1 = x_hat(3);
beta2 = x_hat(4);
gamma2 = x_hat(5);
delta = x_hat(6);
y_hat = alpha + beta1*u(2:N)+gamma1*u(2:N).^2+beta2*u(1:N-1)+gamma2*u(1:N-1).^2+delta*u(2:N).*u(1:N-1);

[resu,rRMS] = resdiualRMS(y(2:N),y_hat);
generatePlots(t(1:N-1),y(2:N),y_hat,rRMS);






