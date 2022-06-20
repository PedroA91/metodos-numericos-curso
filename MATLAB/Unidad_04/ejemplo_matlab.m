clc
clear all
close all

x = linspace(0,2,64);
Y = 5*x.^2+3+rand([1 64]);
p = polyfit(x,Y,3);

figure(1)
plot(x,Y,x,polyval(p,x))
grid on
