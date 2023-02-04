% Secant method
ff=@(x) x-cos(x);
tzero= 0.73908513321516064166;

maxit=100;
ooldx=0;
oldx=1;

ea=100; es=1e-8; %

it=0;
etlist=zeros(1,maxit); 
while 1
    it=it+1;
    dfx=(ff(ooldx)-ff(oldx))/(ooldx-oldx);
    newx=oldx-ff(oldx)/dfx;
    
    ea=abs((newx-oldx)/newx)*100;
    et=abs((tzero-newx)/tzero)*100;
    fprintf("%2d, %f %6.3e %6.3e \n", it, newx, ea, et);

    etlist(it)=et;
    ooldx=oldx;
    oldx=newx;
    if ea<es || it>=maxit; break; end
end

save secant.mat;