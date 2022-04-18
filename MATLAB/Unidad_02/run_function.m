# Comparación inversa vs PLU
clc
clear all
close all

% Datos
n = 256;
a = rand(n,n);
b = eye(n);

% Computación PLU
t_ini = time();
A = PLU(a);
X = solve_PLU(A,b);
t_fin = time();
tplu = t_fin-t_ini;
fprintf("Tiempo de computación PLU %f \n",tplu)

% Computación Gauss
t_ini = time();
x = gauss_eliminacion(a,b);
t_fin = time();
tgauss = t_fin-t_ini;
fprintf("Tiempo de computación Gauss %f \n",tgauss)

% Mensajes
fprintf("%10s \n",'__')
fprintf("| Metodo | Tiempo |\n")
fprintf("| Gauss  |%8.4f|\n",tgauss)
fprintf("| PLU    |%8.4f|\n",tplu)