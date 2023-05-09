function [X]=modrlc2(t_etapa, xant, accion)
R=5.6e3;
L=10e-6;
C=100e-9;
A=[-R/L -1/L ; 1/C 0];
B= [1/L ; 0];
h=t_etapa/10; %Se lo divide por 10 y se lo itera 10 veces en el for
u=accion;
x= xant;
for ii=1:10
 xp= A*x+B*u;
 x=x+xp*h;
end
X=x;