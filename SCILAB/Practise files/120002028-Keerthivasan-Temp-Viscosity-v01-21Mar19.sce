clc
clear
name=input('Enter the name of the gas:','string')
mprintf('\n\t\t>>>Enter temperature-viscosity data of %s<<<',name)
count=9//input('No. of data:')
//for i=1:count
//    t(i)=input('Temperature:')
//    v(i)=input('Viscosity:')
//end
t=[0;20;50;100;200;300;400;500;600]
v=[1.87E-5;1.96E-5;2.10E-5;2.32E-5;2.73E-5;3.12E-5;3.48E-5;3.84E-5;4.48E-5]
mprintf('\n\n\nviscoity,µ(Pas) \tTemperature,T(c) \tT^(3/2)/µ ((ºC)^3.5Pa^-1s^-1)')
for i=1:count
    x(i)=(t(i)^(3/2))/v(i)
    mprintf('\n%.8f\t\t%.3f\t\t\t%.3f',v(i),t(i),x(i))
end
plot(x,t)
xlabel('Temperature(c)')
ylabel('T^(3/2)/v((ºC)^3.5Pa^-1s^-1)')
coefs=regress(t,x)
C=1/coefs(2)
S=C*coefs(1)
mprintf('\n\nSutherland co-efficient S=%f ºC\nSutherland co-efficient C=%f Pa s(ºC)^-0.5',S,C)

mprintf('\n\t>>>Calculation of viscosity at various temperature using the constants<<<')
for i=1:count
    µactual(i)=C*(t(i)^(3/2))/(S+t(i))
end
plot(µactual,v)
