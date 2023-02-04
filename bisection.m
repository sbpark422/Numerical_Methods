%bisection 
ff=@(x) x-cos(x);
tzero= 0.73908513321516064166;

xl=0; xu=1;

ea=100; es=1e-8; maxit=100;
iter=0;

etlist=zeros(1,maxit); 
while 1
    iter=iter+1;
    xr=(xl+xu)/2;
    if iter==1
        ea=abs((xu-xl)/(xu+xl))*100;
    else
        ea=abs((xr-xrold)/xr)*100;
    end
    et=abs((tzero-xr)/tzero)*100;
    
    fprintf("%d, %.4f %.4f %.4f %6.3e %6.3e\n", iter, xl, xu, xr, ea, et); %소수점3자리인데6칸
    test=ff(xl)*ff(xr);
    if test<0 %xl과 xr 사이에 해가 있음
        xu=xr;
    elseif test>0  %xu과 xr 사이에 해가 있음
        xl=xr;
    else
        ea=0; %xr이 해가됨
    end
    
    etlist(iter)=et;
    xrold=xr; 
    if ea<es || iter>=maxit; break; end
end

save bisection.mat;