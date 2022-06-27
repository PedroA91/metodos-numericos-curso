function [n_nodos,n_E,gl] = calculaNumeros(Dato)
	
	% Rutina para calcular 
	S = Dato;
	
	% n_nodos: numero de nodos
	n_nodos = length(union(S.np,S.nn));

	% numero de elementos
	n_E = length(S.Elemento);
	gl = n_nodos;

	% Conteo de grados de libertad
	for k = 1:n_E
		
		if S.Elemento{k,1}(1,1) == 'V'
			
			gl = gl+1;
			
		elseif S.Elemento{k,1}(1,1) == 'R'
			
			gl = gl+1;
			
		elseif S.Elemento{k,1}(1,1) == 'L'
			
			gl = gl+1;
			
		end
		
	end

end