clc
clear all
close all

% Matriz de datos entrada
n = 256;
a = -2.1*ones(n,1);
b = ones(n,1);
A = spdiags([b a b],[-1 0 1],n,n);

tol = 1e-9;
clear a

% Punto inicial de iteracion
x0 = zeros(n,1);

% Matrices del metodo
D = triu(A,0);
P = tril(A,-1);

% Primera iteracion
B = [D eye(n)];
x1 = SustitucionAtras(B);
N = eye(n);	
while true
	
	x0 = x1;
	%B = [D eye(n)-P*x0];
	%x1 = SustitucionAtras(B);
	x1 = D\(N-P*x0);
	
	s = norm(x1-x0)
	
	if s<tol
		
		break
		
	end

end