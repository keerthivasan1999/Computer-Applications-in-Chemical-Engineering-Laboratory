//STHE with 1-shell and 2-tube pass
//COunter current STHE

clc
clear
masshot=450// L/min
hotinlet=65 // C
hotoutlet=45 // C
coldinlet=35 // C
coldoutlet=39 // C
hotspecificheat=2.14 // kJ/k/K
coldspecificheat=4.179 // kJ/kg/K
tubeid=0.015748 // m
tubeod=0.01905 // m
hotdensity=869 // kg/m3
hotviscosity=15E-3 // Pas
hotthermalconduc=0.13 //W/m/k
colddensity=993.3 // kg/m3
coldviscosity=6.935E-3 // Pas
coldthermalconduc=0.626 // W/m/K
overallhtc=350 // W/m2/K
correctionfactor=0.8 //dimensionless
heat=masshot*hotspecificheat*(hotinlet-hotoutlet)
masscold=heat/coldspecificheat/(coldoutlet-coldinlet)
lmtd=((hotinlet-coldoutlet)-(hotoutlet-coldinlet))/log((hotinlet-coldoutlet)/(hotoutlet-coldinlet))
area=heat/overallhtc/correctionfactor/lmtd
mprintf('\n\n Heat transfer area required for the given conditions is %f m2',area)
