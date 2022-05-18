clc
clear all
close all

% Entradas ...
X = linspace(1,10,2560);
Y = 4*X.^2+16*sin(X)-8./X+12*randn([1,2560]);
m = 4;

% Calculo de momentos
mo = zeros(1,2*m+1);
mo(1,1) = length(X);
for j = 2:(2*m+1)

	mo(1,j) = sum(X.^(j-1));

end

A = zeros(m+1,m+1);
b = zeros(m+1,1);
for j = 1:(m+1)

%	A(1,:) = mo(1,1:4)
%	A(2,:) = mo(1,2:5)
%	A(3,:) = mo(1,3:6)
	
	A(j,:) = mo(1,(j):(j+m));
	b(j,1) = sum((X.^(j-1)).*Y);

end

X1 = linspace(1,12,2560);
a = A\b;
a(1:end,1) = a(end:-1:1,1);
y = polyval(a.',X1);


figure(1)
plot(X,Y,"o",...
X1,y,"k","LineWidth",2)
grid on