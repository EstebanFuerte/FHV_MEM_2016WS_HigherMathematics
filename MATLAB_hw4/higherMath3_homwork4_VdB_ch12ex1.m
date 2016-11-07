%% clean up
clear all, close all, clc;

%VdB Excercise 12.1 (page 180)
% f(x) = g(x) - E(E-x)/R = 0
% g(x) = x^3 - 6x^x +10x    ... current through the non linear resistor as a 
%                           function of the voltage x accros its terminal

f_iter = zeros(3,100);
iter(1:3) = 0;
x_start = 0.9;

%% a) Case a
E = 5;    % [V]   voltage of the voltage source
R = 1;    % [Ohm] Resitor value
for i = 1:length(x_start)
  [f_iter(1,:),iter(1)] = NewtonIteration_stst (x_start, E, R);
end


%% b) Case a
E = 15;    % [V]   voltage of the voltage source
R = 3;    % [Ohm] Resitor value

[f_iter(2,:),iter(2)] = NewtonIteration_stst (x_start, E, R);

%% c) Case c
E = 4;      % [V]   voltage of the voltage source
R = 0.5;    % [Ohm] Resitor value

[f_iter(3,:),iter(3)] = NewtonIteration_stst (x_start, E, R);

%% plot f_iter over k
figure
plot(abs(f_iter(1,1:iter(1))),'o'), grid on, hold on,
plot(abs(f_iter(2,1:iter(2))),'ro');
plot(abs(f_iter(3,1:iter(3))),'go'), hold off;
xlabel('k');
ylabel('abs(f(x^k))');