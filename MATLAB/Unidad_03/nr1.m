function [INFO,x1] = nr1(f,df,x0,N,tol,dtol)
	
	% nr1(f,df,x0,N,tol,dtol)
	
	% Metodo de Newton/Raphson ...
	%{
	
	Se resuelve la ecuacion f(x) = 0
	
	VARIABLES DEFAULT
	
	f : function f(x)
	df : function df(x)
	x0: punto de iteracion inicial
	
	VARIABLES EXTRAS
	
	tol: tolerancia de la solucion
	dtol: tolerancia de la derivada
	N: numero maximo de operaciones

	%}
	
	% If's para ignorar o asignar variables 
	% en caso no esten presentes en el argumento ...
	
	if (
		nargin == 3 && inputname(1) == 'f' &&
		inputname(2) == 'df' &&
		inputname(3) == 'x0'
		)
		
		tol = 1e-9;
		dtol = 1e-6;
		N = 1e5;
		
	elseif (
		nargin == 4 && inputname(1) == 'f' &&
		inputname(2) == 'df' &&
		inputname(3) == 'x0' &&
		inputname(4) == 'N'
	)	
		
		tol = 1e-9;
		dtol = 1e-6;
		
	elseif (
		nargin == 6	
	)	
		
		continue
		
	end
	
	% Primera iteracion...
	if  (
		abs(df(x0))>dtol
		)
		
		x1 = x0-f(x0)/df(x0);
		
	end
	
	% Iteraciones del metodo...
	c = 1;
	
	while (
		abs(x1-x0)>tol &&
		abs(f(x0))>tol &&
		abs(df(x0))>dtol &&
		c < N	
		)
		
		x0 = x1;
		x1 = x0-f(x0)/df(x0);
		c = c+1;
		
	end
	
	if (
		c==N
		)
		
		INFO = "Sucesiones agotadas";
		fprintf(INFO+"\n")
		fprintf("pruebe a aumentar las iteraciones \n")
		
	else 
		
		INFO = "Metodo convergente";
		
 	end

end

% Pedro Antonio Peralta Regalado ...