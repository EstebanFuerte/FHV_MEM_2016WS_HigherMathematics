%% clean up
clear all, close all, clc;

% VdB Excercise 12.5 (page 182)
% Use Newton’s method to find all solutions of the two equations
%   (x 1 - 1)^2+2(x 2 - 1)^2 = 1, 
%   3(x 1 + x 2 - 2)^2 +(x 1 - x 2 - 1)^2 = 2
% in the two variables x 1 , x 2 . 
% Each equation defines an ellipse in the (x 1 ,x 2 )-plane. 
% You are asked to find the points where the ellipses 
% intersect.

%% plot figure in parameter space
t = linspace(0,2*pi);
% equation elipse: 
%   f1 = (x1)^2 / a^2 + (x2)^2 / b^2 = 1
a = 1;
b = sqrt(1/2);
% x1 = a * cos(t); % x2 = b * sin(t)
x1 = a * cos(t) + 1;
x2 = b * sin(t) + 1;
figure
plot(x1,x2), hold on;

% f2 = (x3)^2 / c^2 + (x4)^2 / d^2 = 1
% c^2 = 2/3, d^2=2;
c = sqrt(2/3);
d = sqrt(2);
% problem x3 and x4 are not single
% m(t) = x3+x4; n(t) = x3-x4; 
% x3+x4 = c*cos(t)+2
% x3-x4 = d*sin(t)+1  -
% ---------------------
% 2*x4 = c*cos(t)+ d*sin(t) +1
x4 = 1/2*(c*cos(t)+ d*sin(t) +1);
x3 = c*cos(t)+2-x4;
plot(x3,x4);

%% Newton iteration
x = [0; -1];
iter = 1;

f1 = (x(1)-1)^2 + 2 * (x(2)-1)^2 - 1;
f2 = 3 * (x(1)+x(2)-2)^2 + (x(1)-x(2)-1)^2 - 2;

while ((abs(f1) > 10e-8) && (abs(f2) > 10e-8))
    f1 = (x(1)-1)^2 + 2 * (x(2)-1)^2 - 1;
    f2 = 3 * (x(1)+x(2)-2)^2 + (x(1)-x(2)-1)^2 - 2;
    f = [f1;f2];
    
    df =[ 2*x(1) - 2, 4*x(2) - 4;
     8*x(1) + 4*x(2) - 14, 4*x(1) + 8*x(2) - 10];
    
    x = x - df\f;
    iter = iter +1;
    
    plot(x(1,1),x(2,1),'ro')
end