% Newton-Raphson Method
ff=@(x) x-cos(x);
fp=@(x) 1+sin(x);
tzero= 0.73908513321516064166;

maxit=100;
oldx=1;

ea=100; es=1e-8;
it=0; 

etlist=zeros(1,maxit); 
while 1
    it=it+1;
    newx=oldx-ff(oldx)/fp(oldx);
    
    ea=abs((newx-oldx)/newx)*100;
    et=abs((tzero-newx)/tzero)*100;
    fprintf("%2d, %f %6.3e %6.3e \n", it, newx, ea, et); %¼Ò¼öÁ¡

    etlist(it)=et;
    oldx=newx;
    
    if ea<es || it>=maxit 
        break; 
    end
end

save Newton_Raphson.mat;
