clear; clear clc;close all;
X=-[0; 0]; ii=0; t_etapa=1e-8 ; tF=6e-3;
color_='r';
Ts=t_etapa;
u=12; %12 voltios
for t=0:t_etapa:tF
    if t>3e-3
      u=-12; %cambia a -12 en 3ms
    end
    ii=ii+1; % k=ii+2;
    X=modrlc2(t_etapa, X, u);
    x1(ii)=X(1);%Corriente por la L, guarda la primer componente de x
    x2(ii)=X(2);%Tension en C, guarda la segunda componente de x
    acc(ii)=u;
end
t=0:t_etapa:tF;
subplot(3,1,1);hold on;
plot(t,x1,color_);title('Corriente en L');
subplot(3,1,3);hold on;
plot(t,acc,color_);title('Tension de entrada');
xlabel('Tiempo [Seg.]');
subplot(3,1,2);hold on;
plot(t,x2,color_);title('Tension en C');