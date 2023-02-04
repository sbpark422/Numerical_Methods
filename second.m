ff=@(x) tan(x); %i/(x-a), tan(x^2)
tzero= pi/2;

xl=pi/4; xu=5*pi/4;

ea=100; es=1e-8; maxit=100;
iter=0;
while 1
    iter=iter+1;
    xr=(xl+xu)/2;
    if iter==1
        ea=abs((xu-xl)/(xu+xl))*100;
    else
        ea=abs((xr-xrold)/xr)*100;
    end
    et=abs((tzero-xr)/tzero)*100;
    
    fprintf("%d, %.4f %.4f %.4f %6.3e %6.3e\n", iter, xl, xu, xr, ea, et); 
    test=ff(xl)*ff(xr);
    if test<0 
        xu=xr;
    elseif test>0  
        xl=xr;
    else
        ea=0; 
    end
    
    xrold=xr; 
    if ea<es || iter>=maxit; fprintf("%.4f\n", xr); break; end
end