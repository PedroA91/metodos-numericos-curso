function [G,DG,J,dt] = emsambleMatriz(Dato,gl,n_E,n_nodos)
	
	S = Dato;
	G = zeros(gl,gl);
	DG = zeros(gl,gl);
	J = @(t) zeros(gl,1);
	n_ex = 0;
	dt = 0;

	for k = 1:n_E
		
		elem = S.Elemento{k,1}(1,1);
		np = str2num(S.np{k,1});
		nn = str2num(S.nn{k,1});
		
		if S.Elemento{k,1}(1,1) == 'V'
			
			val = S.Parametros{k,1};
			n_ex = n_ex+1;
			l = zeros(gl,1);
			
			if isequal(val,'senoidal')
				
				l(n_nodos+n_ex,1) = 1;
				J = @(t) J(t)+str2num(S.Parametros{1,2})*...
				sin(2*pi*str2num(S.Parametros{1,3})*t)*l;
				dt = max(dt,0.04*1/str2num(S.Parametros{1,3}));
				
			elseif isequal(val,'cosenoidal')
				
				l(n_nodos+n_ex,1) = 1;
				J = @(t) J(t)+str2num(S.Parametros{1,2})*...
				cos(2*pi*str2num(S.Parametros{1,3})*t)*l;
				dt = max(dt,0.04*1/str2num(S.Parametros{1,3}));
			 
			end
			
			G(n_nodos+n_ex,np) = G(n_nodos+n_ex,np)+1;
			G(n_nodos+n_ex,nn) = G(n_nodos+n_ex,nn)-1;
			G(np,n_nodos+n_ex) = G(np,n_nodos+n_ex)+1;
			G(nn,n_nodos+n_ex) = G(nn,n_nodos+n_ex)-1;
			
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
			
		elseif S.Elemento{k,1}(1,1) == 'L'
			
			val = S.Parametros{k,1};
			n_ex = n_ex+1;
			DG(n_nodos+n_ex,n_nodos+n_ex) = DG(n_nodos+n_ex,n_nodos+n_ex)...
			-str2num(S.Parametros{k,2});
			G(n_nodos+n_ex,np) = G(n_nodos+n_ex,np)+1;
			G(n_nodos+n_ex,nn) = G(n_nodos+n_ex,nn)-1;
			G(np,n_nodos+n_ex) = G(np,n_nodos+n_ex)+1;
			G(nn,n_nodos+n_ex) = G(nn,n_nodos+n_ex)-1;
			
		elseif S.Elemento{k,1}(1,1) == 'C'
			
			val = S.Parametros{k,1};
			DG(np,np) = DG(np,np)+str2num(S.Parametros{k,2});
			DG(nn,nn) = DG(nn,nn)+str2num(S.Parametros{k,2});
			DG(nn,np) = DG(nn,np)-str2num(S.Parametros{k,2});
			DG(np,nn) = DG(np,nn)-str2num(S.Parametros{k,2});
			
		elseif S.Elemento{k,1}(1,1) == 'G'
			
			val = S.Parametros{k,1};
			G(np,np) = G(np,np)+str2num(S.Parametros{k,2});
			G(nn,nn) = G(nn,nn)+str2num(S.Parametros{k,2});
			G(nn,np) = G(nn,np)-str2num(S.Parametros{k,2});
			G(np,nn) = G(np,nn)-str2num(S.Parametros{k,2});
			
		end
		
	end
	
end
