clc
clear all
close all

X = linspace(1,10,2560);
Y = 4*X.^2+16*sin(X)-8./X+50*randn([1,2560]);

n = length(X);
sumx2 = sum(X.^2);
sumx = sum(X);
A = [sumx2 sumx; sumx n];

sumxy = sum(X.*Y);
sumy = sum(Y);
b = [sumxy; sumy];

% aqui se resuelve el sistema de ecuaciones
a = A\b;

y = a(1,1)*X+a(2,1);

figure(1)
plot(X,Y,'o','LineWidth',2,...
X,y,'k','LineWidth',2)
grid on