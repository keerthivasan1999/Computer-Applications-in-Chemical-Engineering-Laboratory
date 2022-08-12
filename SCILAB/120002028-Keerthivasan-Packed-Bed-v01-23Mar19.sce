clc
clear
txt=['Enter the particle density in kg/m3:';'Enter the particle diameter in m:';'Enter the sphericity of the particle:';'Enter the fluid density in kg/m3:';'Enter the fluif viscosity in Pa s:';'Enter the voidage:';'Enter the bed diameter in m:';'Enter the bed height in m:';'Enter the volumetric flow rate in m3/s:']
data=x_mdialog('Enter the syste details:',txt,['200';'0.7';'1';'1000';'0.00136';'0.6';'15';'10';'0.08333'])
pardensity=evstr(data(1))
pardia=evstr(data(2))
sphericity=evstr(data(3))
fluiddensity=evstr(data(4))
fluidviscosity=evstr(data(5))
voidage=evstr(data(6))
beddiameter=evstr(data(7))
bedheight=evstr(data(8))
volflowrate=evstr(data(9))
crosssecarea=%pi*(beddiameter^2)/4
velocity=volflowrate/crosssecarea
viscouspbyl=150*fluidviscosity*velocity*((1-voidage)^2)/(sphericity^2)/(pardia^2)/(voidage^3)
inertialpbyl=1.75*fluiddensity*(velocity^2)*(1-voidage)/sphericity/pardia/(voidage^3)
totalpbyl=viscouspbyl+inertialpbyl
mprintf("\n\t\t\t----->>>>>>Pressure drop in fixed bed<<<<<<-----\n\n\t\t\t>>>GIVEN DATA<<<")
mprintf('\nParticle density:%.3f kg/m3',pardensity)
mprintf('\nFluid density:%.3f kg/m3',fluiddensity)
mprintf('\nParticle diameter:%.3f m',pardia)
mprintf('\nSphericity of the particle:%i',sphericity)
mprintf('\nFluid viscosity:%.8f Pa s',fluidviscosity)
mprintf('\nVoidage at minimum fluidization:%.3f',voidage)
mprintf('\nReactor diameter:%.3f m',beddiameter)
mprintf('\nReactor height:%.3f m',bedheight)
mprintf('\nVolumetric flow rate of the fluid:%.4f m3/s',volflowrate)
mprintf('\n\n\t\t\t>>>COMPUTED DATA<<<')
mprintf('\nCross sectional area of bed:%.4f m2',crosssecarea)
mprintf('\nVelocity of the fluid in the bed:%.8f m/s',velocity)
mprintf('\n\n>>>Viscous pressure gradient:%.8f Pa/m <<<',viscouspbyl)
mprintf('\n>>>Inertial pressure gradient:%.8f Pa/m <<<',inertialpbyl)
mprintf('\n>>>Total pressure gradient across the packed bed:%.8f Pa/m <<<',viscouspbyl+inertialpbyl)














