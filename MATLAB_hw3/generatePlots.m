
## Author: stefan.stark <stefan.stark@ATDOTR2120>
## Created: 2016-10-19

function [] = generatePlots (t,y,y_hat,rRMS)
  figure
  subplot(1,2,1); plot(t,y), title('scalar output sequence');
  hold on; plot(t,y_hat,'r'); hold off; legend('orig','y_{hat}');
  subplot(1,2,2); plot(t,rRMS), title('RMS residual');

endfunction
