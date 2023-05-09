A=[-470e6 -0.1e6; 10e6 0]; B=[0.1e6 ; 0]; C=[4.7e3 0]; D=0; %escribo las matrices
[num,den]= ss2tf(A,B,C,D) %calculo la funcion de transferencia
TF=tf(num,den) %funcion de transferencia TF(S)=VR(S)/VE(S)
r=roots(den); %autovalores
lambda1=r(1,1)
lambda2=r(2,1)
TR=0.1*reallog(0.95)/lambda1 %tiempo al que corresponde el 95% de la din�mica m�s r�pida, de donde se selecciona el tiempo de integraci�n menor que �se tR calculado
TL=3*reallog(0.05)/lambda2 %el tiempo de simulaci�n en el cual pr�cticamente ya no hay m�s transitorios, se toma la constante de tiempo m�s lenta

