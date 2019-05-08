pkg load geometry

iris = load ("Iris.dat");

[m n] = size(iris);

%---------||---------||---------||---------||---------||---------||----------%

    qc1 = 0;
    qc2 = 0;
    qc3 = 0;

valor1=0;
res=0;

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
q_acerto = 0;

%t_rodadas = 0;
%primeiro for para rodar a porcertagem%
for prop = 1:9
    valor1 = valor1 + 0.1;
    
    %segundo para as rodadas de cada porcertagem%

    q_acerto = 0;
    q_erro = 0;
 
   
    for i = 1:30
       
           A = randperm(m);
           d_testese = iris(A,:);
            
           v1= m*valor1
           v2= v1+1;,
           d_teste = d_testese(1:v1,:);
           %d_treinamento = d_testese(v2:m,:);
           
           d1= sqrt(distancePoints( d_teste(1,:), d_teste(2,:)));
           
           ponto = d_teste(2,:);
           df=d1;
           
           for teste = 3:v1
              d2 = sqrt(distancePoints( d_teste(1,:), d_teste(3,:)));
             
              if(d2 < df)
                  df=d2;
                  ponto = d_teste(3,:); 
              endif
            
           endfor
           
           
           if(d_teste(1,5) == ponto(1,5) && d_teste(1,5) == 1)
              q_acerto = q_acerto + 1;
              qc1 = qc1 + 1;
           endif

           if(d_teste(1,5) == ponto(1,5) && d_teste(1,5) == 2)
              q_acerto = q_acerto + 1;
              qc2 = qc2 + 1;
           endif
              
           if(d_teste(1,5) == ponto(1,5) && d_teste(1,5) == 3)
                q_acerto = q_acerto + 1;
                qc3 = qc3 + 1;
           endif
           
           
       
       
       
     endfor 
     
        media = q_acerto/v1;
        tx_acerto(prop)=media;
        media_min = min(media);
        media_max = max(media);

        %tx_acerto_c1(prop) = media_c1;
        %tx_acerto_c0(prop) = media_c0 ;
 
    endfor
media_c1 = qc1/v1;
media_c2 = qc2/v1;
media_c3 = qc3/v1;
        %figure(1);
        %hold on;
        %grid on;
        %plot(tx_acerto,'g', 'LineWidth', 2);  
        %plot(tx_acerto_c0,'r', 'LineWidth', 2); 
        %plot(tx_acerto_c1,'k', 'LineWidth', 2); 

%plot(q_acerto,'b');    
%d_teste2 = d_testes1e(1:70,:);
%d_treinamento2 = d_testes1e(71:701,:);
