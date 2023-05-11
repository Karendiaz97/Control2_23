function [X]=modmotor(t_etapa, xant, accion)
Laa=366e-6; J=5e-9;Ra=55.6;B=0;Ki=6.49e-3;Km=6.53e-3;
Va=accion; TL=13.93e-4;%TORQUE
h=1e-7;
omega= xant(1);
%wp= xant(2);
ia=xant(2);
for ii=1:t_etapa/h
iap=-ia*(Ra/Laa)-(Km/Laa)*omega+Va/Laa; %ec 5
wp=(Ki/J)*ia-(B/J)*omega-TL/J;%ec 6
%wpp =(-wp*(Ra*J+Laa*B)-omega*(Ra*B+Ki*Km)+Va*Ki)/(J*Laa);
%wp=wp+h*wpp;
ia=ia+h*iap; %integro corriente
omega=omega+h*wp; %integro velocidad
end
X=[omega,ia];