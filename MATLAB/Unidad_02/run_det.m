# Comparación inversa vs PLU
clc
clear all
close all

% Datos
n = 64;
a = rand(n,n);
b = eye(n);

tic
det(a)
toc 
tic
dA = determinante(a);
toc