function [ x,xk, fxk ] = myfzero( fname, l, u )
    x = u;
    [f, fprime] = feval(fname,x);
    
    fxk(1) = f;
    xk(1) = x;
    i = 2;
    
    while ((abs(f) > 10e-5) && ((u-l) > 10e-5))
        xn = x - f/fprime;  % newton iterate
        [fxn, fprimexn] = feval(fname,xn);
        
        str = sprintf('x:%d; xn: %d; abs(fxn): %d; 0.99*abs(f):%d;',x,xn,abs(fxn),0.99*abs(f)); 
        %disp(str);
        
        if((l<xn<u) && (abs(fxn) < 0.99*abs(f)))
            x = xn;

        else
            x = (l+u)/2;
        end
        
        [fl, fprimel] = feval(fname,l);
        if(fl*f<0)
            u = x;
        else
            l = x;
        end
        
        [f, fprime] = feval(fname,x);
        fprime = fprimexn;
        fxk(i) = f;
        xk(i) = x;
        str = sprintf('xn: %d; fxn: %d; u-l: %d',xn,f,u-l); 
        disp(str);
        i = i+1;
    end
    x = f;
end

