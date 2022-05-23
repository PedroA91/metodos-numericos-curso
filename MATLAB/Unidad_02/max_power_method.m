function L = max_power_method(A,tol)
	% Funcion para computar el metodo de las potencias
	% para calcular el eigenvalor mas grande
	
	%{
	
	L = max_power_method(A,tol)
	A: Matriz con eigenvalores por calcular
	tol : tolerancia del metodo}
	
	%}
	
	n = length(A);
	
	% Valor inicial de iteracion
	x0 = ones(n,1);
	
	% Primera iteracion
	x0 = x0/norm(x0);
	x1 = A*x0;
	x1 = x1/norm(x1);
	L = x0.'*x1/x0.'*x0;
	
	% Bucle de iteraciones
	while norm(x1-x0)>tol
		
		x0 = x1;
		x1 = A*x0;
		x1 = x1/norm(x1);
		L = x0.'*x1/x0.'*x0;
		
 	end
	
end

% Pedro Antonio Peralta Regalado