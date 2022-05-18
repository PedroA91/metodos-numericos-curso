clc
clear all
close all

% Ejemplo de uso de nr_system.m

f = @(X) [X(1)^2-X(2)-4; X(1)+5*X(2)-10]
df = @(X) [2*X(1) -1; 1 5];
x0 = [3; 1];
tol = 1e-9;
dtol = 1e-6;
N = 2000;

% LLamando funcion

[INFO,x1] = nr_system(f,df,x0,N,tol,dtol);