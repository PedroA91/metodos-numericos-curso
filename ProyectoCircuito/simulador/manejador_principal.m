clc
clear all
close all

% nombre del archivo 
file = "net_list0.csv";

if exist(file)

	S = lectura_red(file);

else 

	fprintf("Archivo no existe\n")
	error("Revise la existencia del archivo\n")

end

[n_nodos,n_E,gl] = calculaNumeros(S);
% Termina lectura y calculo de parametros

[G,DG,J,dt] = emsambleMatriz(S,gl,n_E,n_nodos);
gnd = str2num(S.tierra{1,1}(1,1));
ind = 1:gl;
ind = ind != gnd;
d = 1./min(abs(eig(G,DG)));
dt = min(d,dt);
V = zeros(gl,1);

g = G(ind,ind);
dg = DG(ind,ind);
v = V(ind,1);

j_t = [J(0) J(dt)];
jt = j_t(ind,:);

A = (dg+(dt/2)*g)\(dg-(dt/2)*g);
b = (dg+(dt/2)*g)\sum(jt,2)*dt/2;
v = A*v+b;