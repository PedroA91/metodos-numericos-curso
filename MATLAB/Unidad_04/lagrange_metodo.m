function p = lagrange_metodo(X,Y)
	
	% Funcion para implementar el metodo de Lagrange
	
	n = length(Y);
	p = zeros(1,n);

	for j = 1:n
		
		p(1,:) = p(1,:)+Y(1,j)*poly_lagrange(X,j);
		
	end	
	
end
