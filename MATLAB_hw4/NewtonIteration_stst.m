%Author: stefan.stark
%Created: 2016-11-07

function [f_iter,numIter] = NewtonIteration_stst (x_start, E, R)
  x = linspace(0,4,1000);
  g = zeros(length(x),1);
  f = zeros(length(x),1);

  g = x.^3-6*x.^2+10*x;
  f = g-(E-x)/R;

  figure
  plot(x,f), grid on; hold on;

  
  f_iter = zeros(1,100);
  % Newton iteration
  % 1. choose starting point x_start
  % 2. calculate f(x) and f'(x)
  % 3. perform iteration steps

  % 1. choose starting point x_start
  x_start = x_start;

  % 2. calculate f(x) and f'(x)
  x = x_start;
  % calculation of first step
  g = x^3-6*x^2+10*x;
  f = g-(E-x)/R;
  delta_x = 0;        % init
  numIter = 1;        % init - number of iterations

  % 3. perform iteration steps
  while (abs(f) > 10e-8)
    plot(x,f,'ro');
    
    g = x^3-6*x^2+10*x;
    f = g-(E-x)/R;
    f_der = 3*x^2 -12*x +10 + 1/R;
    
    delta_x = -f/f_der;
    x = x + delta_x;
    
    f_iter(numIter) = f;
    numIter=numIter+1;
    
  end
    titlePlot = sprintf('f(x) with E=%i, R=%i and x start = %d',E,R,x_start);
    title(titlePlot);
    ylabel('f(x)');
    xlabel('x');
end
