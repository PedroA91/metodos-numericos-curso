clc
clear all
close all

% Ejemplo de regresión lineal ...

% Datos de entrada ...
n = 512;
X = linspace(1,20,n);
Y = 4*X+4*sin(X)-8./X+5*randn([1,n]);

% INICIA ...
n = length(X);

% Coeficientes de la matriz ...
sumx2 = sum(X.^2)/n;
sumx = sum(X)/n;
sumxy = sum(X.*Y)/n;
sumy = sum(Y)/n;
A = [n sumx; sumx sumx2];
b = [sumx; sumxy];

% Solución del sistema de ecuaciones ...
a = A\b;
y = a(2,1)*X+a(1,1);

% Texto de mensaje de coeficientes
texto = ['Los coeficientes son',
'dados por: ', 
 'b: ', num2str(a(1,1)),
 'm: ', num2str(a(2,1)),
 'La recta es Y(X) = mX+b'];

% Graficos
figure(1)
plot(X,Y,'or','LineWidth',2,...
X,y,'-k','LineWidth',3)
grid on
title("Ejemplo de ajuste lineal","FontSize",16)
xlabel("Coordenada X","FontSize",12)
ylabel("Coordenada Y","FontSize",12)
legend("Datos Exp.","Ajuste lineal","Location","West")
text(12,20,texto,"FontSize",12)
print -depslatexstandalone "LinearRegression_plot.tex"
system "pdflatex LinearRegression_plot.tex"