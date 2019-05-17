pkg load geometry

agrupamento = load ("agrupamento.dat");
centroide = load ("centroides.dat");

[m n] = size(agrupamento);
[x y] = size(centroide);

%---------||---------||---------||---------||---------||---------||----------%

k = 0;
j=1;
elbow = 0;
vari = [];
teste1 =[12,5];
d_eulc = [];
%---------||---------setando as classes iniciais---------||----------%

centroide(1,5)=1;
centroide(2,5)=2;

#inserindo uma coluna de zeros no dataset

for i=1 :1000
  agrupamento(i,5)=0;
endfor

d1=10;
#coloquei o valor de 10 so para teste, mas vamos mudar
#para que ele compare com o valor dos centroide 1 e 2 

for i = 1 : m
   
    dist1 = sqrt(distancePoints (agrupamento(i,1:4),centroide(1,1:4)));
    dist2 = sqrt(distancePoints (agrupamento(i,1:4),centroide(2,1:4)));
      
      if(dist1 <= dist2) 
        agrupamento(i,5)=1;
      else
        agrupamento(i,5)=2;      
      endif
       
  #printf("\n");
  endfor
%elbow
x = agrupamento(1, 5);
ba= count(x, 2);

%if ()




%figure(1);
%title("Teste K-Means");
%grid on;
%hold on;
%plot3(agrupamento(1:350,1),agrupamento(1:350,2),agrupamento(1:350,4), 'kx');
%plot3(agrupamento(351:600,1),agrupamento(351:600,2),agrupamento(351:600,4), 'k+');
%plot3(agrupamento(601:1000,1),agrupamento(601:1000,2),agrupamento(601:1000,4), 'k*');
