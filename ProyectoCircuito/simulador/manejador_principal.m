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

% La siguiente funcion calcula los grados de libertad (gl),
% numero de nodos (n_nodos) y numero de elementos (n_E)s

[n_nodos,n_E,gl] = calculaNumeros(S);
% Termina lectura y calculo de parametros

% Determinando la condicion inicial del circuito
[G,J] = emsambleMatriz0(S,gl,n_E,n_nodos);
gnd = str2num(S.tierra{1,1}(1,1));
J0 = J(0);
ind =(1:gl); ind = (ind != gnd);
g = G(ind,ind);
j0 = J0(ind,1);
v0 = linsolve(g,j0);

[G,DG,J,dt] = emsambleMatriz(S,gl,n_E,n_nodos);
g = G(ind,ind);
dg = DG(ind,ind);

l = abs(eig(g,dg));
L = max(abs(l(!isinf(l))));
d = 1./L;
dt = 0.025*min(d,dt);
t_final = 50e-3;
t = 0:dt:t_final;
nt = length(t);
V = zeros(gl,1);
v = zeros(gl-1,nt);
v = V(ind,1);
v(:,1) = v0;

for j = 1:(nt-1)
	
	j_t = [J(t(1,j)) J(t(1,j+1))];
	jt = j_t(ind,:);
	v(:,j+1) = (dg+(dt/2)*g)\(dg*v(:,j)-(dt/2)*g*v(:,j)+sum(jt,2)*dt/2);
	
end

figure(1)
plot(t,v(1:(n_nodos-1),:),"-k","LineWidth",2)
grid on