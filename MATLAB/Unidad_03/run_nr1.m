clc
clear all
close all

% Valores de entrada ...
f = @(x) x.^3+x-3;
df = @(x) 3*x.^2+1;
x0 = 1;
%tol = 1e-6;
dtol = 1e-9;
N = 20;

% Llamando el metodo ...
[INFO,x1] = nr1(f,df,x0);