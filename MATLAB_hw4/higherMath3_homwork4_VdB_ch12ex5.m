%% clean up
clear all, close all, clc;

% VdB Excercise 12.5 (page 182)
% Use Newton’s method to find all solutions of the two equations
%   (x 1 ? 1)^2+2(x 2 ? 1)^2 = 1, 
%   3(x 1 + x 2 ? 2)^2 +(x 1 ? x 2 ? 1)^2 = 2
% in the two variables x 1 , x 2 . 
% Each equation defines an ellipse in the (x 1 ,x 2 )-plane. 
% You are asked to find the points where the ellipses 
% intersect.

%% plot figure to find a good starting point
x1o = linspace(-10,10,1000);
x2o = linspace(-10,10,1000);
f1o = (x1o-1).^2 + 2 * (x2o -1).^2 - 1;
f2o = 3 * ((x1o+x2o )-2).^2 + (x1o-x2o -1).^2 - 2;

figure
plot3(x1o,x2o,f1o), hold on;
plot3(x1o,x2o,f2o,'r')

%%
x = [0.7; 1];
iter = 1;

f1 = (x(1)-1)^2 + 2 * (x(2)-1)^2 - 1;
f2 = 3 * (x(1)+x(2)-2)^2 + (x(1)-x(2)-1)^2 - 2;

while ((abs(f1) > 10e-8) && (abs(f2) > 10e-8))
    f1 = (x(1)-1)^2 + 2 * (x(2)-1)^2 - 1;
    f2 = 3 * (x(1)+x(2)-2)^2 + (x(1)-x(2)-1)^2 - 2;
    f = [f1;f2];
    
    df =[ 2*x(1) - 2, 4*x(2) - 4;
     8*x(1) + 4*x(2) - 14, 4*x(1) + 8*x(2) - 10];
    
    x = x - inv(df)*f;
    iter = iter +1;
end
iter
f
x
plot3(x(1),x(2),f1,'go')