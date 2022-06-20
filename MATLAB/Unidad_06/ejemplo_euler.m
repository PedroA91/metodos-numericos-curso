clc
clear all
close all

% dx/dt+4x=10sin(2pi*t);
% dx/dt=-4x+10sin(2pi*t);

% Euler metodo adelante
f = @(x,T) -4*x+10*sin(2*pi*T);
h = 0.7;
x0 = 0;
tfinal = 10;

% Empieza
t = 0:h:tfinal;
N = length(t);
Y = zeros(1,N);

Y(1,1) = x0;

for j = 1:(N-1)
	
	Y(1,j+1) = Y(1,j)+h*f(Y(1,j),t(1,j));

end

figure(1)
plot(t,Y,"-r","LineWidth",2)
grid on