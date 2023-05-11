%PARA EL CASO DE R=4.7K
A=[-470e6 -0.1e6; 10e6 0]; B=[0.1e6 ; 0]; C=[4.7e3 0]; D=0; %escribo las matrices
[num,den]= ss2tf(A,B,C,D); %calculo la funcion de transferencia
TF=tf(num,den) %funcion de transferencia TF(S)=VR(S)/VE(S)
r=roots(den); %autovalores
lambda1=r(1,1)%LAMBDA 1
lambda2=r(2,1)%LAMBDA 2
TR=0.2*reallog(0.95)/lambda1 %tiempo al que corresponde el 95% de la dinámica más rápida, de donde se selecciona el tiempo de integración menor que ése tR calculado
TL=3*reallog(0.05)/lambda2 %el tiempo de simulación en el cual prácticamente ya no hay más transitorios, se toma la constante de tiempo más lenta
%PARA EL CASO DE R=5.6K
A1=[-560e6 -0.1e6; 10e6 0]; C1=[5.6e3 0]; %escribo las matrices
[num1,den1]= ss2tf(A1,B,C1,D); %calculo la funcion de transferencia
TF1=tf(num1,den1) %funcion de transferencia TF(S)=VR(S)/VE(S)
r1=roots(den1); %autovalores
lambda11=r1(1,1)%LAMBDA 1
lambda21=r1(2,1)%LAMBDA 2
TR1=0.2*reallog(0.95)/lambda11 %tiempo al que corresponde el 95% de la dinámica más rápida, de donde se selecciona el tiempo de integración menor que ése tR calculado
TL1=1*reallog(0.05)/lambda21 %el tiempo de simulación en el cual prácticamente ya no hay más transitorios, se toma la constante de tiempo más lenta

