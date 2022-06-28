function [G,J] = emsambleMatriz0(Dato,gl,n_E,n_nodos)
	
% Funcion para implementar las matrices del analisis lineal
% (incluyendo fuentes controladas)

	S = Dato;
	G = zeros(gl,gl);
	J = @(t) zeros(gl,1);
	n_ex = 0;
	dt = 0;

% Leer cada uno de los elementos previamente parseados
	for k = 1:n_E
		
		elem = S.Elemento{k,1}(1,1);
		np = str2num(S.np{k,1});
		nn = str2num(S.nn{k,1});
		
		% Anexando el estampado de los voltajes
		if S.Elemento{k,1}(1,1) == 'V'
			
			val = S.Parametros{k,1};
			n_ex = n_ex+1;
			l = zeros(gl,1);
			
			% LLenando los distintos voltajes
			if isequal(val,'senoidal')
				
				l(n_nodos+n_ex,1) = 1;
				A = str2num(S.Parametros{k,2});
				w = str2num(S.Parametros{k,3});
				
				J = @(t) J(t)+A*sin(2*pi*w*t)*l;
				dt = 0.04*max(dt,1/str2num(S.Parametros{1,3}));
				
			elseif isequal(val,'cosenoidal')
				
				l(n_nodos+n_ex,1) = 1;
				A = str2num(S.Parametros{k,2});
				w = str2num(S.Parametros{k,3});
				
				J = @(t) J(t)+A*cos(2*pi*w*t)*l;
				dt = 0.04*max(dt,2*pi/w);
			
			elseif isequal(val,'bateria')
				
				l(n_nodos+n_ex,1) = 1;
				A = str2num(S.Parametros{k,2});
				
				J = @(t) J(t)+A*l;
				dt = 0.04*max(dt,2*pi/w);
			
			elseif isequal(val,'triangular')
				
				l(n_nodos+n_ex,1) = 1;
				A = str2num(S.Parametros{k,2});
				T = str2num(S.Parametros{k,3});
				
				J = @(t) J(t)+A*mod(t,T)*l;
				dt = 0.04*max(dt,str2num(S.Parametros{1,3}));
			 
			end
			
			G(n_nodos+n_ex,np) = G(n_nodos+n_ex,np)+1;
			G(n_nodos+n_ex,nn) = G(n_nodos+n_ex,nn)-1;
			G(np,n_nodos+n_ex) = G(np,n_nodos+n_ex)+1;
			G(nn,n_nodos+n_ex) = G(nn,n_nodos+n_ex)-1;
			
		% Anexando el estampado de la resistencia	
		elseif S.Elemento{k,1}(1,1) == 'R'
			
			val = S.Parametros{k,1};
			n_ex = n_ex+1;
			
			if isequal(val,'const')
				
				G(n_nodos+n_ex,n_nodos+n_ex) = G(n_nodos+n_ex,n_nodos+n_ex)...
				-str2num(S.Parametros{k,2});
			 
			end
			
			G(n_nodos+n_ex,np) = G(n_nodos+n_ex,np)+1;
			G(n_nodos+n_ex,nn) = G(n_nodos+n_ex,nn)-1;
			G(np,n_nodos+n_ex) = G(np,n_nodos+n_ex)+1;
			G(nn,n_nodos+n_ex) = G(nn,n_nodos+n_ex)-1;
		 
		% Anexando el estampado del corto
		elseif S.Elemento{k,1}(1,1) == 'S'
			
			val = S.Parametros{k,1};
			n_ex = n_ex+1;
			
			G(n_nodos+n_ex,np) = G(n_nodos+n_ex,np)+1;
			G(n_nodos+n_ex,nn) = G(n_nodos+n_ex,nn)-1;
			G(np,n_nodos+n_ex) = G(np,n_nodos+n_ex)+1;
			G(nn,n_nodos+n_ex) = G(nn,n_nodos+n_ex)-1;
			
		% Anexando el estampado de la inductancia
		elseif S.Elemento{k,1}(1,1) == 'L'
			
			val = S.Parametros{k,1};
			n_ex = n_ex+1;
			G(n_nodos+n_ex,n_nodos+n_ex) = G(n_nodos+n_ex,n_nodos+n_ex)...
			-1e8;
			
			G(n_nodos+n_ex,np) = G(n_nodos+n_ex,np)+1;
			G(n_nodos+n_ex,nn) = G(n_nodos+n_ex,nn)-1;
			G(np,n_nodos+n_ex) = G(np,n_nodos+n_ex)+1;
			G(nn,n_nodos+n_ex) = G(nn,n_nodos+n_ex)-1;
			
		% Anexando el estampado de la capacitancia
		elseif S.Elemento{k,1}(1,1) == 'C'
			
			val = S.Parametros{k,1};
			G(np,np) = G(np,np)+1e8;
			G(nn,nn) = G(nn,nn)+1e8;
			G(nn,np) = G(nn,np)-1e8;
			G(np,nn) = G(np,nn)-1e8;
			
		% Anexando el estampado de la conductancia
		elseif S.Elemento{k,1}(1,1) == 'G'
			
			val = S.Parametros{k,1};
			G(np,np) = G(np,np)+str2num(S.Parametros{k,2});
			G(nn,nn) = G(nn,nn)+str2num(S.Parametros{k,2});
			G(nn,np) = G(nn,np)-str2num(S.Parametros{k,2});
			G(np,nn) = G(np,nn)-str2num(S.Parametros{k,2});
			
		end
		
	end
	
end
