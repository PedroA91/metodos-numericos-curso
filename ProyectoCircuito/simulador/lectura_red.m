function S = lectura_red(file)
	
	% Lectura del archivo file
	% este archivo contiene la descripcion 
	% en formato de listado de red, de un 
	% circuito electrónico


	% Celda para etiquetado de valores ...
	Etiquetas = {};
	
	% Arreglo para guardar datos
	% Element: elementos
	% Np: nodos positivos
	% Nn: nodos negativos
	% Params: Parametros del elementos
	Element = {};
	Np = {};
	Nn = {};
	Params = {};
	gnd = {};
	data_sim = {};

	% Lectura del archivo ...
	fid = fopen(file);

	fprintf("Leyendo el archivo %s ... \n",file)

	% Lectura de etiquetas ...
	G = fgets(fid);
	f = strfind(G,",");
	n = f(1,1); Etiquetas{end+1,1} = G(1,1:(n-1));
	m = f(1,2); Etiquetas{end,2} = G(1,(n+1):(m-1));
	n = m; m = f(1,3); Etiquetas{end,3} = G(1,(n+1):(m-1));
	n = m; m = f(1,4); Etiquetas{end,4} = G(1,(n+1):(m-1));
	
	G = fgets(fid);
	while G != -1
		
		% LLenado datos de simulacion
		if G(1,1:3) == 'sim'	
			
			f = strfind(G,",");
			n = f(1,1);
			data_sim{end+1,1} = G(1,1:(n-1));
			m = f(1,2);
			data_sim{end,2} = G(1,(n+1):(m-1));
			for j = 3:6
				n = m;
				m = f(1,j);
				data_sim{end,j} = G(1,(n+1):(m-1));
			end
			n = m;
			data_sim{end,j} = G(1,(n+1):end);
			
		% Asignacion de tierra
		elseif G(1,1:3) == 'gnd'
			
			gnd{end+1,1} = G(1,5:end);
			
		% Asignacion de datos de la red
		else 
			
			f = strfind(G,",");
			n = f(1,1);
			Element{end+1,1} = G(1,1:(n-1));
			m = f(1,2);
			Np{end+1,1} = G(1,(n+1):(m-1));
			n = m;
			m = f(1,3);
			Nn{end+1,1} = G(1,(n+1):(m-1));
			n = m;
			m = f(1,4);
			Params{end+1,1} = G(1,(n+1):(m-1));
			for j = 5:6
				n = m;
				m = f(1,j);
				Params{end,j-3} = G(1,(n+1):(m-1));
			end
			n = m;
			Params{end,4} = G(1,(n+1):end);
			
		end 
		
		G = fgets(fid);
		
	end
	
	fprintf("Lectura de archivo %s, ha finalizado \n",file)

	% Termina lectura de archivo
	fclose(fid);
	
	% Estructura de datos 
	S.(Etiquetas{1,1}) = Element;
	S.(Etiquetas{1,2}) = Np;
	S.(Etiquetas{1,3}) = Nn;
	S.(Etiquetas{1,4}) = Params;
	S.tierra = gnd;
	S.sim_info = data_sim;