pkg load geometry

agrupamento = load ("agrupamento.dat");
centroide = load ("centroides.dat");

[m n] = size(agrupamento);
[x y] = size(centroide);

%---------||---------||---------||---------||---------||---------||----------%

k = [];
elbow = 0;
%---------||---------setando as classes iniciais---------||----------%
for i = 1:6, j = 7:12
    centroide(i,5)=1;
    centroide(j,5)=2;
endfor


%figure(1);
%title("ALGORITMO KNN");
%hold on;
%grid on;
%plot(tx_acerto,'g', 'LineWidth', 2);  
%plot(tx_acerto_c1,'r', 'LineWidth', 2); 
%plot(tx_acerto_c2,'k', 'LineWidth', 2);
%plot(tx_acerto_c3,'b', 'LineWidth', 2); 
 

%printf("Minimo: %d \n", media_min);
%printf("Maximo: %d \n", media_max);
%printf("tx_acerto: %d \n",  tx_acerto);  
%printf("\n");
%printf("tx_acerto_c1 %d \n", tx_acerto_c1); 
%printf("\n");
%printf("tx_acerto_c2 %d \n" , tx_acerto_c2);
%printf("\n");
%printf("tx_acerto_c3 %d \n", tx_acerto_c3); 


