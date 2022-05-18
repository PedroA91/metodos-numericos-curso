function p = poly_lagrange(X,k)

	% Funcion que implementa la generacion 
	% de polinomios de Lagrange

	n = length(X);
	p = 1;

	x = X(1,1:n != k);
	p = 1;
	for j = 1:(n-1)
		
		p = conv([1 -x(1,j)],p);
		
	end
	
	% Salida contenida en una matriz fila
	% que contiene los coeficientes del polinomio
	p = p/polyval(p,X(1,k));

end
