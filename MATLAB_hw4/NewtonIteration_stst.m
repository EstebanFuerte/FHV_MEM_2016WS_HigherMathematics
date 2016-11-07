## Copyright (C) 2016 stefan.stark
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} NewtonIteration_stst (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: stefan.stark <stefan.stark@ATDOTR2120>
## Created: 2016-11-07

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
  g = g = x^3-6*x^2+10*x;
  f = g-(E-x)/R;
  delta_x = 0;        % init
  numIter = 1;        % init - number of iterations

  % 3. perform iteration steps
  while (abs(f) > 10e-8)
    plot(x,f,'ro');
    
    g = g = x^3-6*x^2+10*x;
    f = g-(E-x)/R;
    f_der = 3*x^2 -12*x +10 + 1/R;
    
    delta_x = -f/f_der;
    x = x + delta_x;
    
    f_iter(numIter) = f;
    numIter++;
    
  endwhile
    titlePlot = sprintf("f(x) with E=%i, R=%i and x start = %d",E,R,x_start);
    title(titlePlot);
    ylabel('f(x)');
    xlabel('x');

endfunction
