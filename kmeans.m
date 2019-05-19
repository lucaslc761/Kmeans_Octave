
pkg load geometry

agrupamento = load ("agrupamento.dat");
centroide = load ("centroides.dat");

[m n] = size(agrupamento);
[x y] = size(centroide);

%---------||---------||---------||---------||---------||---------||----------%
p1=[];
p2=[];
k = 0;
soma=0;
elbow = 0;
%---------||---------setando as classes iniciais---------||----------%


#inserindo uma coluna de zeros no dataset que será a coluna da classificação.

for i=1 :1000
  agrupamento(i,5)=0;
endfor


%Fará a adição de um novo cluster ao final de todo o processo para cada rodada
%com K clusters.
for k = 2 : x
    
    %inicializa variavel da primeira contagem de elementos por classe.
    for p = 1:k
        p1(p)=0; 
    endfor
    %inicializa variavel da segunda contagem de elementos por classe.
    for np = 1:k
        p2(np)=0; 
    endfor
    
    %inicia a verificação da distancia de cada elemento para os K clusters
    %inserindos.
    for i = 1 : m
        d_geral=[];   
        for h = 1:k
            dist1 = sqrt(distancePoints (agrupamento(i,1:4),centroide(h,1:4)));
            d_geral(h) = dist1;
            menor= min(d_geral);
        endfor
        
        %verificar menor distancia
        for t=1:k
            if( d_geral(t)==menor) 
                agrupamento(i,5)=t;
                p1(t)+=1;
            endif
        endfor
        
    endfor
 
%recalculando os centroides 
    for b=1:k
      soma(b,1:4) = 0;
      novo_c(b,1:4) = 0;
      
        for f=1:m
          if (agrupamento(f,5)==b)
            v = agrupamento(f,1:4);
            soma = soma + v;
          endif
        endfor
        if (p1(b)>0)
            centroide(b,1:4) = soma(b,:)/p1(b);
        endif
    endfor
    
    %recalculando classificação com os novos centroides dados os novos pontos 
    for ni = 1 : m
        d_geral=[];     
        
        for nh = 1:k
            dist1 = sqrt(distancePoints (agrupamento(ni,1:4),centroide(nh,1:4)));
            d_geral(nh) = dist1;
            menor= min(d_geral);
        endfor
        
        %verificar nova menor distancia
        for nt=1:k
            
            if( d_geral(nt)==menor) 
                agrupamento(ni,5)=nt;
                p2(nt)+=1;
            endif
        endfor 
    endfor
    
endfor


%if ()




%figure(1);
%title("Teste K-Means");
%grid on;
%hold on;
%plot3(agrupamento(1:350,1),agrupamento(1:350,2),agrupamento(1:350,4), 'kx');
%plot3(agrupamento(351:600,1),agrupamento(351:600,2),agrupamento(351:600,4), 'k+');
%plot3(agrupamento(601:1000,1),agrupamento(601:1000,2),agrupamento(601:1000,4), 'k*');
