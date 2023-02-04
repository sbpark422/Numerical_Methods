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
    
    fprintf("%d, %.4f %.4f %.4f %6.3e %6.3e\n", iter, xl, xu, xr, ea, et); %�Ҽ���3�ڸ��ε�6ĭ
    test=ff(xl)*ff(xr);
    if test<0 %xl�� xr ���̿� �ذ� ����
        xu=xr;
    elseif test>0  %xu�� xr ���̿� �ذ� ����
        xl=xr;
    else
        ea=0; %xr�� �ذ���
    end
    
    etlist(iter)=et;
    xrold=xr; 
    if ea<es || iter>=maxit; break; end
end

save bisection.mat;