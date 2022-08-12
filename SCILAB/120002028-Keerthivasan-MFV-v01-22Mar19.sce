clc
clear
txt=['Enter the particle density in kg/m3:';'Enter the minimum particle diameter in m:';'Enter the maximum particle daimeter in m:';'Enter the step change in diameter:';'Enter the sphericity of the particle:';'Enter the fluid density in kg/m3:';'Enter the fluif viscosity in Pa s:';'Enter the voidage at minimum fluidization:';'Enter the reactor diameter in m:';'Enter the reactor height in m:']
data=x_mdialog('Enter the syste details:',txt,['1400';'0.01';'0.1';'0.01';'1';'1000';'0.0001';'0.6';'15';'10'])
Particledensity=evstr(data(1))
Minimumparticledia=evstr(data(2))
Maximumparticledia=evstr(data(3))
stepchange=evstr(data(4))
sphericity=evstr(data(5))
fluiddensity=evstr(data(6))
fluidviscosity=evstr(data(7))
mfvoidage=evstr(data(8))
reactordiameter=evstr(data(9))
reactorheight=evstr(data(10))
mprintf("\n  >>>Minimum fluidization velocity determination for various particle daimeter<<<\n\t\t\t>>>GIVEN DATA<<<\n\n")
mprintf('\nParticle density:%.3f kg/m3',Particledensity)
mprintf('\nFluid density:%.3f kg/m3',fluiddensity)
mprintf('\nMinimum particle diameter:%.3f m',Minimumparticledia)
mprintf('\nMaximum particle diameter:%.3f m',Maximumparticledia)
mprintf('\nStep change in diameter:%.3f m',stepchange)
mprintf('\nFluid viscosity:%.3f Pa s',fluidviscosity)
mprintf('\nVoidage at minimum fluidization:%.3f',mfvoidage)
mprintf('\nReactor diameter:%.3f m',reactordiameter)
mprintf('\nReactor height:%.3f m',reactorheight)
deltaPbyL=(Particledensity-fluiddensity)*mfvoidage*9.81
Y=150*fluidviscosity*((1-mfvoidage)^2)/(sphericity^2)/(mfvoidage^3)
X=1.75*fluiddensity*(1-mfvoidage)/sphericity/(mfvoidage^3)
//disp(X,Y)
diameter=Minimumparticledia:stepchange:Maximumparticledia
n=length(diameter)
mprintf('\n\n\nParticle diameter,d(m)\t\tMinimum fluidization velocity,umf(m/s)')
for i=1:n
    umf1(i)=-(Y/2/X/diameter(i))+((1/2/X)*(sqrt((Y*Y/diameter(i)/diameter(i))+(4*X*diameter(i)*deltaPbyL))))
    umf2(i)=-(Y/2/X/diameter(i))-((1/2/X)*(sqrt((Y*Y/diameter(i)/diameter(i))+(4*X*diameter(i)*deltaPbyL))))    
    if umf1(i)<0
        umf(i)=umf1(i)
    else
        if umf2(i)<0
            umf(i)=umf1(i)
        end
    end
    mprintf('\n\t%.3f\t\t\t\t%.3f',diameter(i),umf(i))
end
plot(umf,diameter')
xlabel('Minimum Fluidization Velocity,umf(m/s)')
ylabel('Diameter of the particle,d(m)')
title('Plot of Minimum fluidization velocity versus diameter of the particle')




