% Ejemplos de uso de:
% - gauss_eliminacion.m
% - gauss_eliminacion_v2.m
% - PLU.m
% - PLU_v2.m
% Comparación inversa 
% GAUSS vs PLU

%% Ejemplo de solución de un sistema de ecuaciones
% Las siguientes instrucciones crean las matrices

% RESET

clc
clear all
close all

% Datos de entrada
% n: dimensión del sistema
% a: matriz que contiene los coeficientes del lado
% izquierdo del sistema
% b: matriz que contiene los coeficientes del lado
% derecho del sistema

n = 256;
a = rand(n,n);
b = eye(n);

%%

%% Usando PLU vectorizado
% * LLamando la función 
% con los datos ingresados se ejecutan 
% las siguientes instrucciones
% Las siguientes instrucciones muestran como
% llamar PLU_v2.m y solve_PLU.m 

% t_ini: captura de tiempo inicial
% t_fin: captura de tiempo final
% A: Matriz Factorizada
%   Se guarda la factorización mediante
%   A = [u11, u12, ..., u1n; l21, u22, ..., u2n; 
%   ...; ln1, ln2, ..., unn]
% tplu: Calculando del delta de tiempo

t_ini = time();
A = PLU_v2(a);
y = solve_PLU(A,b);
t_fin = time();
tplu = t_fin-t_ini;
fprintf("Tiempo de computación PLU %f \n",tplu)

%%

%% Usando Eliminaciones Gaussianas
% * LLamando la función 
% con los datos ingresados se ejecutan 
% las siguientes instrucciones
% Las siguientes instrucciones muestran como
% llamar gauss_eliminacion_v2.m

% t_ini: captura de tiempo inicial
% t_fin: captura de tiempo final
% tplu: Calculando del delta de tiempo

t_ini = time();
y = gauss_eliminacion_v2(a,b);
t_fin = time();
tgauss2 = t_fin-t_ini;
fprintf("Tiempo de computación Gauss 2 %f \n",tgauss2)

%%

%% Funciones utilizadas
##
#
# <include>PLU_v2.m</include>
#
# <include>solve_PLU.m</include>
#
# <include>gauss_eliminacion_v2.m</include>
#

% RESUMEN

fprintf("%10s \n","-_-_-_-_-_-_-_-_-_-")
fprintf("| Metodo | Tiempo |\n")
fprintf("| PLU:   |%8.4f|\n",tplu)
fprintf("| GAUSS: |%8.4f|\n",tgauss2)