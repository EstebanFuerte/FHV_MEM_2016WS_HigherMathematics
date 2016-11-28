%% clean up
clear all, close all, clc;

% VdB Excercise 14.2 (page 212)
% A hybrid of the bisection method and Newton’s method
[x,xk, fxk] = myfzero('fct1',-1,0.9);
figure; plot(abs(fxk),'o'); title('fxk');
figure; plot(abs(xk-x),'o'); title('abs(xk-x)');