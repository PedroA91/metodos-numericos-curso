function [X,dY] = derivada(X,Y)
	
	% Funcion para computar la derivada de datos en vectores

	n = length(X);
	dY = zeros(1,n);

	dX = X(1,2)-X(1,1);
	dY(1,n) = (Y(1,2)-Y(1,1))/dX;
	
	dX = X(1,n)-X(1,n-1);
	dY(1,n) = (Y(1,n)-Y(1,n-1))/dX;

	for j = 2:(n-1)
		
		dX = X(1,j+1)-X(1,j-1);
		dY(1,j) = (Y(1,j+1)-Y(1,j-1))/(dX);
		
	end

end