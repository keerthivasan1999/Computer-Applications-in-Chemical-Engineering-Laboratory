clc
clear
count=13
c=[0;1;5;8;10;8;6;4;3;2.2;1.5;0.6;0]
t=[0;1;2;3;4;5;6;7;8;9;10;12;14]
mprintf('\n\n\t\t>>>Table for calculation of area under c-curve<<<\n\n')
mprintf('\nConcentration,C(g/m3)\tTime,t(min)\tΔt(min)\t\tAvg. C(g/m3)\tΔt*Avg.C(g min/m3)')
mprintf('\n\t%f\t%f\t-\t\t-\t\t-',c(1),t(1))
Areaunderccurve=0;
for i=2:count
    deltat(i)=t(i)-t(i-1)
    cavg(i)=(c(i-1)+c(i))/2
    cavgdeltat(i)=deltat(i)*cavg(i)
    mprintf('\n\t%f\t%f\t%f\t%f\t%f',c(i),t(i),deltat(i),cavg(i),cavgdeltat(i))
    Areaunderccurve=Areaunderccurve+cavgdeltat(i)
end
mprintf('\n\t\t\t\t\t\t\tSum:\t\t%f',Areaunderccurve)
mprintf('\nArea under the C-curve:%f g min/m3',Areaunderccurve)
mprintf('\n\n\t\t>>>Calculation of area under E-curve<<<\n\n')
mprintf('\nConcentration,C(g/m3)\tTime,t(min)\tE(min^-1)\tΔt(min)\t\tAvg.E(min^-1)\tΔt*Avg.E')
E(1)=c(1)/Areaunderccurve
mprintf('\n\t%f\t%f\t%f\t-\t\t-\t\t-',c(1),t(1),E(1))
AreaunderEcurve=0
for i=2:count
    deltat(i)=t(i)-t(i-1)
    E(i)=c(i)/Areaunderccurve
    Eavg(i)=(E(i-1)+E(i))/2
    Eavgdeltat(i)=deltat(i)*Eavg(i)
    mprintf('\n\t%f\t%f\t%f\t%f\t%f\t%f',c(i),t(i),E(i),deltat(i),Eavg(i),Eavgdeltat(i))
    AreaunderEcurve=AreaunderEcurve+Eavgdeltat(i)
end
mprintf('\n\t\t\t\t\t\t\t\t\tSum:\t\t%f',AreaunderEcurve)
mprintf('\nArea under the E-curve:%f',AreaunderEcurve)
mprintf('\n\n\t\t>>>Table for calculation of area under t*c vs t curve<<<\n\n')
mprintf('\nConcentration,C(g/m3)\tTime,t(min)\tC*t(g min/m3)\tΔt(min)\t\tAvg.C*t(g min/m3)\tΔt*Avg.C*t(g min^2/m3)')
ct(1)=c(1)*t(1)
Areaunderctcurve=0
mprintf('\n\t%f\t%f\t%f\t-\t\t-\t\t-',c(1),t(1),ct(1))
for i=2:count
    deltat(i)=t(i)-t(i-1)
    ct(i)=c(i)*t(i)
    ctavg(i)=(ct(i-1)+ct(i))/2
    ctavgdeltat(i)=deltat(i)*ctavg(i)
    mprintf('\n\t%f\t%f\t%f\t%f\t%f\t%f',c(i),t(i),ct(i),deltat(i),ctavg(i),ctavgdeltat(i))
    Areaunderctcurve=Areaunderctcurve+ctavgdeltat(i)
end
mprintf('\n\t\t\t\t\t\t\t\t\tSum:\t\t%f',Areaunderctcurve)
mprintf('\nArea under the C*t vs t curve:%f g min2/m3',Areaunderctcurve)
mprintf('\n\n\t\t>>>Table for calculation of area under C*t^2 vs t curve<<<\n\n')
mprintf('\nConcentration,C(g/m3)\tTime,t(min)\tC*t^t(g min^2/m3)\tΔt(min)\t\tAvg.C*t^2(g min^2/m^3)\tΔt*Avg.C*t^2(g min^3/m^3)')
ct(1)=c(1)*t(1)
Areaundercttcurve=0
mprintf('\n\t%f\t%f\t%f\t-\t\t-\t\t\t-',c(1),t(1),ct(1))
for i=2:count
    deltat(i)=t(i)-t(i-1)
    ctt(i)=c(i)*t(i)*t(i)
    cttavg(i)=(ctt(i-1)+ctt(i))/2
    cttavgdeltat(i)=deltat(i)*cttavg(i)
    mprintf('\n\t%f\t%f\t%f\t%f\t%f\t\t%f',c(i),t(i),ctt(i),deltat(i),cttavg(i),cttavgdeltat(i))
    Areaundercttcurve=Areaundercttcurve+cttavgdeltat(i)
end
mprintf('\n\t\t\t\t\t\t\t\t\t\tSum:\t\t%f',Areaundercttcurve)
mprintf('\nArea under the C*t^2 vs t curve:%f g min3/m3',Areaundercttcurve)
meanresidencetime=Areaunderctcurve/Areaunderccurve
varience=Areaundercttcurve/Areaunderccurve
mprintf('\n\n\nMean residence time:%f min\nVarience:%f min^2',meanresidencetime,varience)
