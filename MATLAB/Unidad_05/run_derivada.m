clc
clear all
clear all

f = @(x) (x.^2).*exp(-x);
X = linspace(0,10,256);
Y = f(X);

[X,dY] = derivada(X,Y);
[X,dY] = derivada(X,dY);


figure(1)
plot(X,Y,X,dY)