pkg load geometry

agrupamento = load ("agrupamento.dat");
centroide = load ("centroides.dat");

[m n] = size(agrupamento);
[x y] = size(centroide);

%---------||---------||---------||---------||---------||---------||----------%

k = [];
elbow = 0;
vari = [];
d_eulc = [];
%---------||---------setando as classes iniciais---------||----------%

centroide(1,5)=1;
centroide(2,5)=2;

figure(1);
title("Teste K-Means");
grid on;
hold on;
plot3(agrupamento(1:350,1),agrupamento(1:350,2),agrupamento(1:350,4), 'kx');
plot3(agrupamento(351:600,1),agrupamento(351:600,2),agrupamento(351:600,4), 'k+');
plot3(agrupamento(601:1000,1),agrupamento(601:1000,2),agrupamento(601:1000,4), 'k*');
