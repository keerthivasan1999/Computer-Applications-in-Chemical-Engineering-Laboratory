clc
clear
count=input('Enter the number of data for computation:')
//for i=1:count
//    mprintf('\n\t\tEnter the %i data:\n',i)
//    c(i)=input('concentration:')
//    t(i)=input('Time:')
//end
c=[10;8;6;5;3;2;1]
t=[0;20;40;60;120;180;300]
count=length(c)
for i=1:(count-1)
    rate(i)=(-1)*(c(i+1)-c(i))/(t(i+1)-t(i))
    cavg(i)=(c(i)+c(i+1))/2
    lncavg=log(cavg)
    lnrate=log(rate)
end
mprintf('\nConcentration(mol/L)\tTime(s)\t\trate(mol/L/s)\t\tln(-r)(mol/L/s)\t\tcavg(mol/L)\t\tln(cavg)(mol/L)')
for i=1:count
    if i<>count
        mprintf('\n%f\t\t%f \t%f\t\t%f\t\t%f\t\t%f',c(i),t(i),rate(i),lnrate(i),cavg(i),lncavg(i))
    end
    if i==count
        mprintf('\n%f\t\t%f\t-\t\t\t-\t\t\t-\t\t\t-',c(i),t(i))
    end
end
m=lncavg
for i=1:(count-1)
    m(i,2)=1
end
n=m\lnrate
p=exp(n(2))
mprintf('\nOrder of the reaction:%f\nRate constant:%f',n(1),p)
mprintf('\n\nFinal rate expression in terms of reactant A:\t\t -r=(%f) C^ (%f)',n(1),p)
