function [X]=modrlc2(t_etapa, xant, accion)
R=5.6e3;
L=10e-6;
C=100e-9;
A=[-R/L -1/L ; 1/C 0];
B= [1/L ; 0];
h=9e-12; %TR tiempo rapido
u=accion;
x= xant;
for ii=1:t_etapa/h
 xp= A*x+B*u;
 x=x+xp*h;
end
X=x;