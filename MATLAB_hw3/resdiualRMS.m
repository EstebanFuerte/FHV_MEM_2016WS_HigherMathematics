## Author: stefan.stark <stefan.stark@ATDOTR2120>
## Created: 2016-10-19
## Description: Calcualte the root-mean-square residual

function [resu,Rrms] = resdiualRMS (y, y_hat)
  resu = y_hat-y;
  N = length(y);
  
  for i=1:N
    sumRMS = sum((y(i)-y_hat(i))^2);
  end

Rrms = sqrt((1/(N-1)*sumRMS));
  
  
endfunction
