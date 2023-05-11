clear;clear all;
X=-[0; 0];ii=0;t_etapa=1e-6;wRef=10;tF=5;
%Constantes del PID
Kp=10;Ki=1000;Kd=0;color_='r';
Ts=t_etapa; %tiempo de muestreo
A1=((2*Kp*Ts)+(Ki*(Ts^2))+(2*Kd))/(2*Ts);
B1=(-2*Kp*Ts+Ki*(Ts^2)-4*Kd)/(2*Ts);
C1=Kd/Ts;
u=12;
for t=0:t_etapa:tF
ii=ii+1;k=ii+2;
    if u>12
        u=12;
    end
X=modmotor(t_etapa, X, u);
e(k)=wRef-X(1); %ERROR
u=u+A1*e(k)+B1*e(k-1)+C1*e(k-2); %PID
x1(ii)=X(1);%Omega
x2(ii)=X(2);%Corriente Ia
    if u>12
       u=12;
    end
acc(ii)=u;
end
t=0:t_etapa:tF;
subplot(3,1,1);hold on;
plot(t,x1,color_);title('Salida y, \omega_t');
subplot(3,1,3);hold on;
plot(t,acc,color_);title('Entrada u_t, v_a');
xlabel('Tiempo [Seg.]');
subplot(3,1,2);hold on;
plot(t,x2,color_);title('Salida y, Corriente Ia');