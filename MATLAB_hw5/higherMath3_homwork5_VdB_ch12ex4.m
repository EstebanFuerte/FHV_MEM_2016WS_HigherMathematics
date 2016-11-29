% Author: Stefan Stark
% Date:   28.11.2016

%% clean up
clear all, close all, clc;

% VdB Excercise 12.4 (page 181)
% A hybrid of the bisection method and Newtons method

[x,xk, fxk] = myfzero('fct1',-1,0.9);
figure; plot(abs(fxk),'o'); title('fxk');
figure; plot(abs(xk-x),'o'); title('abs(xk-x)');