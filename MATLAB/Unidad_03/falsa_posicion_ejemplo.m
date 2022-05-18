clc
clear all
close all

% definicion de funcion
f = @(x) (4e-12)*(exp((12-x)/0.026)-1)-x/8
b = 12;
a = 11.2;

% inicio de iteraciones
c = (a+b)/2;

% iteraciones condicionales
while abs(f(c))>1e-6
	
	fa = f(a); 
	fb = f(b);
	c = (a*fb-b*fa)/(fb-fa)
	
	if  fa*fb<0

		b = c;
		
	elseif  fa*fb>0	
		
		a = c;	
		
	else 
		
		break
		
	end	
	
end