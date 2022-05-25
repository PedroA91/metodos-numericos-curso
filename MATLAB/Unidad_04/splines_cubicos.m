clc
clear all
close all

% Datos ...
x = linspace(0,2,64);
y = sin(2*pi*x);
N = 256;

[X,Y] = spline_cub(x,y,N);

figure(1)
plot(X,Y,"-xr","LineWidth",2,...
x,y,"-xk","LineWidth",2)
grid on
title("Ejemplo Splines","FontSize",16)
xlabel("Coordenada X","FontSize",12)
ylabel("Coordenada Y","FontSize",12)
axis on