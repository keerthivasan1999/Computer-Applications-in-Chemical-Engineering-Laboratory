clc 
clear
txt=['Density of particle in kg/m3:';'Density of fluid in kg/m3:';'Mininum particle diameter in m:';'Maximum particle diameter in m:';'Viscosity of the fluid in Pas:';'Step change in particle diameter:']
data=x_mdialog('Enter the system details:',txt,['1500';'1000';'0.1';'1';'0.0001';'0.1'])
Densityofparticle=evstr(data(1))
Densityoffluid=evstr(data(2))
Mininumparticlediameter=evstr(data(3))
Maximumparticlediameter=evstr(data(4))
Viscosityoffluid=evstr(data(5))
stepchange=evstr(data(6))
x=Mininumparticlediameter:stepchange:Maximumparticlediameter;
n=length(x)
for i=1:n
    Ar(i)=4*(x(i)^3)*Densityoffluid*(Densityofparticle-Densityoffluid)*9.81/3/(Viscosityoffluid^2)
    if Ar(i)<24 then 
        TSV(i)=(x(i)^2)*(Densityofparticle-Densityoffluid)*9.81/18/Viscosityoffluid 
        regime(i)="Stokes"
    end
    if Ar(i)>440000 then
        TSV(i)=sqrt(3.03030*x(i)*(Densityofparticle-Densityoffluid)*9.81/Densityoffluid)
        regime(i)="Newton"
    end
    if Ar(i)>=24 & Ar(i)<=440000 then
        dpstar(i)=(4*Ar(i)/3)^(1/3)
        utstar(i)=((18/(dpstar(i)^2))+(2.335/(dpstar(i)^0.5))-(1.744/(dpstar(i)^0.5)))^(-1)
        TSV(i)=utstar(i)/((Densityoffluid^2)/Viscosityoffluid/9.81/(Densityofparticle-Densityoffluid))^(1/3)
        regime(i)="Intermeidate"
    end
end
mprintf('\nDiameter of particle: %.3f m ot %.3f m \nDensity of the fluid: %i kg/m3 \nDensity of the particle: %i kg/m3 \nViscosity of fluid: %f Pas\n\n',Mininumparticlediameter,Maximumparticlediameter,Densityoffluid,Densityofparticle,Viscosityoffluid)
mprintf('\nParticle diameter(m)\tTerminal settling velocity(m/s)\t   Regime of settling')
for i=1:n
    mprintf('\n\t%.3f\t\t\t%f\t\t\t%s',x(i),TSV(i),regime(i))
end
plot(x',TSV,'r-')
title("Terminal settling velocity plot")
xlabel("Particle diameter in m")
ylabel("Terminal settling velocity in m/s")

