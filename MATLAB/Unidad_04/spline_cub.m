function [X,Y] = spline_cub(x,y,N)
	
	% Funcion para computar los interpoladores cubicos de datos
	% tabulados, utilizando el metodo natural de frontera ...
	%
	% [X,Y] = spline_cub(x,y,N);
	%
	% x: datos en el eje X
	% y: datos en el eje Y
	% N: numero de datos
	
	
	% Inicia metodo ...
	n = length(x);
	h = x(1,2:n)-x(1,1:(n-1));
	dy = (y(1,2:n)-y(1,1:(n-1)))./h;

	% Ensamble de la matriz lado izquierdo/derecho ...
	S = zeros(n,n);
	B = zeros(n,1);

	for j = 2:(n-1)
		
		S(j,(j-1):(j+1)) = [h(1,j-1) 2*(h(1,j-1)+h(1,j)) h(1,j)];
		B(j,1) = 3*(dy(1,j)-dy(1,j-1));
		
	end

	S(1,1) = 2*h(1,1); S(1,2) = h(1,1); S(n,n-1) = h(1,n-1); S(n,n) = 2*h(1,n-1);
	B(1,1) = 3*dy(1,1); B(n,1) = -3*dy(1,n-1);
	% Termina ensamble 

	% Calculo de los coeficientes ...
	% mediante el Algoritmo de Thomas
	% para matrices en bandas
	
	n = length(S);
	
	for j = 1:(n-2)
		
		a = S(j+1,j)/S(j,j);
		S(j+1,j:(j+2)) = S(j+1,j:(j+2))-a*S(j,j:(j+2));
		B(j+1,1) = B(j+1,1)-a*B(j,1);
		
	end
	j = n-1;
	a = S(j+1,j)/S(j,j);
	S(j+1,j:(j+1)) = S(j+1,j:(j+1))-a*S(j,j:(j+1));
	B(j+1,1) = B(j+1,1)-a*B(j,1);
	
	X = zeros(n,1);
	X(n,1) = B(n,1)/S(n,n);
	X(n-1,1) = (B(n-1,1)-B(n,1)*X(n,1));
	
	for j = (n-1):-1:1
		
		X(j,1) = (B(j,1)-S(j,j+1)*X(j+1,1))/S(j,j);
		
 	end
	% Termina soluciones del sistema ...
	
	m = X.';
	S = zeros(n-1,4);

	% Coeficientes de cada polinomio ...
	S(:,4) = y(1,1:(n-1)).';
	S(:,3) = dy.'-(h.*(2*m(1,1:(n-1))+m(1,2:n))/3).';
	S(:,2) = m(1,1:(n-1)).';
	S(:,1) = ((m(1,2:n)-m(1,1:(n-1)))./(3*h)).';

	X = linspace(min(x),max(x),N);
	Y = zeros(1,N);

	% Evaluando cantidad por polinomio de interpolacion ...
	for k = 1:N
		
		for j = 1:(n-1)
			
			if X(1,k) >= x(1,j) && X(1,k) < x(1,j+1)
				
				Y(1,k) = polyval(S(j,:),X(1,k),[],[x(1,j) 1]);
				
			end
			
		end
		
	end
	
end
