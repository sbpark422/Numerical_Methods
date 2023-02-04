%false position 
ff=@(x) x-cos(x);
tzero= 0.73908513321516064166;

xl=0; xu=1;

ea=100; es=1e-8; maxit=100;
iter=0;

etlist=zeros(1,maxit); 
while 1
    iter=iter+1;
    xr=xu - ff(xu)*(xl-xu)/(ff(xl)-ff(xu)); 
    if iter==1
        ea=nan; 
    else
        ea=abs((xr-xrold)/xr)*100;
    end
    fprintf("%d, %.4f %.4f %.4f %6.3e %6.3e\n", iter, xl, xu, xr, ea, et); 
    et=abs((tzero-xr)/tzero)*100;
    
    etlist(iter)=et;
    test=ff(xl)*ff(xr);
    if test<0
        xu=xr;
    elseif test>0
        xl=xr;
    else
        ea=0;
    end
    xrold=xr;
    
    if ea<es || iter>=maxit
        break;
    end
end

save falsePosition.mat;