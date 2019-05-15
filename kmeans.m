pkg load geometry

iris = load ("Iris.dat");

[m n] = size(iris);

%---------||---------||---------||---------||---------||---------||----------%

qc1 = 0;
qc2 = 0;
qc3 = 0;

qac1 = 0;
qac2 = 0;
qac3 = 0;

valor1=0;

erro=0;

v1=0;
v2=0;

tx_acerto = (1:9);

media = 0;
media_min = 0;
media_max = 0;

%q_teste1 = 0;
%q_teste0 = 0;

ponto = 1:4;


%t_rodadas = 0;
%primeiro laÃ§o para rodar a porcertagem%
for prop = 1:9
    valor1 = valor1 + 0.1;
  
    q_acerto = 0;
    q_erro = 0;
    qac1 = 0;
    qac2 = 0;
    qac3 = 0;  
    qc1 = 0;
    qc2 = 0;
    qc3 = 0;
    %segundo laÃ§o para as rodadas de cada porcertagem
    for i = 1:30

           A = randperm(m);
           d_treinamentoe = iris(A,:);
            
           v1= m*valor1
           v2= v1+1;
           
           d_treinamento = d_treinamentoe(1:v1,:);
           %d_teste = d_testese(v2:m,:);
           
           d1= sqrt(distancePoints( d_treinamento(1,1:4), d_treinamento(2,1:4)));
           
           ponto = d_treinamentoe(2,:);
           df=d1;
           
           for teste = 3:v1
                  d2 = sqrt(distancePoints( d_treinamento(1,1:4), d_treinamento(teste,1:4)));
                  
                  if(d2 < df)
                      df=d2;
                      ponto = d_treinamento(teste,:); 
                  endif
            
           endfor
           
           if(d_treinamento(1,5) == 1)
                qc1 = qc1 + 1;
           
                if(d_treinamento(1,5) == ponto(1,5))
                      q_acerto = q_acerto + 1;
                      qac1 = qac1 + 1;
                endif
                
           endif
           
           
           if(d_treinamento(1,5) == 2)
                 qc2 = qc2 + 1;
           
                if(d_treinamento(1,5) == ponto(1,5))
                      q_acerto = q_acerto + 1;
                      qac2 = qac2 + 1;
                endif
                
           endif   
           
           
           if(d_treinamento(1,5) == 3)
                qc3 = qc3 + 1;
           
                if(d_treinamento(1,5) == ponto(1,5))
                      q_acerto = q_acerto + 1;
                      qac3 = qac3 + 1;
                endif
                
           endif     
          %t_rodadas = t_rodadas + 1; 
   endfor 
     
           media = q_acerto/30;
                     
           media_c1 = qac1/qc1;
           
           media_c2 = qac2/qc2;
           media_c3 = qac3/qc3;
           tx_acerto(prop)=media;
           media_min = min(tx_acerto);
           media_max = max(tx_acerto);
          
           tx_acerto_c1(prop) = media_c1;
           tx_acerto_c2(prop) = media_c2;
           tx_acerto_c3(prop) = media_c3;
endfor

figure(1);
title("ALGORITMO KNN");
hold on;
grid on;
plot(tx_acerto,'g', 'LineWidth', 2);  
plot(tx_acerto_c1,'r', 'LineWidth', 2); 
plot(tx_acerto_c2,'k', 'LineWidth', 2);
plot(tx_acerto_c3,'b', 'LineWidth', 2); 
 

printf("Minimo: %d \n", media_min);
printf("Maximo: %d \n", media_max);
printf("tx_acerto: %d \n",  tx_acerto);  
printf("\n");
printf("tx_acerto_c1 %d \n", tx_acerto_c1); 
printf("\n");
printf("tx_acerto_c2 %d \n" , tx_acerto_c2);
printf("\n");
printf("tx_acerto_c3 %d \n", tx_acerto_c3); 

%d_teste2 = d_testes1e(1:70,:);
%d_treinamento2 = d_testes1e(71:701,:);
