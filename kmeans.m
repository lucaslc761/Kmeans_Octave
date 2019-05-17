pkg load geometry

agrupamento = load ("agrupamento.dat");
centroide = load ("centroides.dat");

[m n] = size(agrupamento);
[x y] = size(centroide);

%---------||---------||---------||---------||---------||---------||----------%
p1=[];
p2=0;
k = 0;
j=1;
soma=0;
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


#coloquei o valor de 10 so para teste, mas vamos mudar
#para que ele compare com o valor dos centroide 1 e 2 
for k = 2 : 5
    for i = 1 : m
        d_geral=[];
        for x = 1:k
            dist1 = sqrt(distancePoints (agrupamento(i,1:4),centroide(x,1:4)));
            d_geral(x) = dist1;
            p1(x)=0;
            %dist2 = sqrt(distancePoints (agrupamento(i,1:4),centroide(2,1:4)));
        endfor
        %verificar menor distancia
        for t=1:k
            
            menor= min(d_geral);  
            if( d_geral(t)==menor) 
              agrupamento(i,5)=t;
              p1(t)+=1;
            endif
        endfor
      #printf("\n");
    endfor
    
    for x=1:k
            for i=1:m
              if (agrupamento(i,5)==x)
                soma = soma +agrupamento(i,1:4);
              endif
        endfor
    endfor
    novo_c = soma/(p1);
endfor


%if ()




%figure(1);
%title("Teste K-Means");
%grid on;
%hold on;
%plot3(agrupamento(1:350,1),agrupamento(1:350,2),agrupamento(1:350,4), 'kx');
%plot3(agrupamento(351:600,1),agrupamento(351:600,2),agrupamento(351:600,4), 'k+');
%plot3(agrupamento(601:1000,1),agrupamento(601:1000,2),agrupamento(601:1000,4), 'k*');
