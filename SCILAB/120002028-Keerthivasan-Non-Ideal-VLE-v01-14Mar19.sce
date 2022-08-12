//P-x-y VLE plot for ethylacetate-toluene binary mixture
clc
clear
A=[4.13361 4.05043];
B=[1195.13 1327.62];
C=[212.47 217.625];
T=input('Enter the temperature in C:')
alpha=input('Enter the alpha van-laar coefficient:')
bet=input('Enter the beta van-laar coefficent:')
function [ps]=vaporpressure(a,b,c,t)
    ps=10^(a-(b/(c+t)))
endfunction
function [gam1]=activity1(a,b,x)
    gam1=10^(a/(1+(a*x/b/(1-x)))^2)
endfunction
function [gam2]=activity2(a,b,x)
    gam2=10^(b/(1+(b*x/a/(1-x)))^2)
endfunction
ps(1)=vaporpressure(A(1),B(1),C(1),T)
ps(2)=vaporpressure(A(2),B(2),C(2),T)
x1=0:0.01:0.9
n=length(x1)
mprintf("   x1\t\t   x2\t\t   y1\t\t   y2\t\t   P")
for i=1:n
        gam1(i)=activity1(alpha,bet,x1(i));
        gam2(i)=activity2(alpha,bet,x1(i));
        P(i)=(gam1(i)*x1(i)*ps(1))+(gam2(i)*(1-x1(i))*ps(2));
        y1(i)=x1(i)*ps(1)/P(i);
        x2(i)=1-x1(i)
        y2(i)=1-y1(i)
        mprintf("\n%f\t%f\t%f\t%f\t%f",x1(i),x2(i),y1(i),y2(i),P(i));
end
plot(x1',P,y1,P)
xlabel("Mole fraction of component 1 in liquid(x) anf vapor(y)")
ylabel("Total pressure,P(bar)")
title("P-x-y plot")
legend(["P-x";"p-y"])
scf(1)
plot(x1',y1')
xlabel("Mole fraction of component 1 in liquid phase")
ylabel("Mole fraction of component 1 i vapor phase")
title("VLE graph")
