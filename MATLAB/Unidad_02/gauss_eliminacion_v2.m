function X = gauss_eliminacion_v2(a,b)  
  
  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
  % FUNCION QUE IMPLEMENTA LAS ELIMINACIONES GAUSSIANAS 
  % CON INTERCAMBIO DE FILAS SIGUIENDO 
  % EL ESQUEMA PIVOTEO PARCIAL Y ESCALAMIENTO
  %
  % Considere el sistema multilineal:
  % aX=b
  % 
  % a: matriz de coeficientes, matriz cuadrada invertible
  % b: matriz de estimulos, por cada sistema de ecuaciones
  % esta matriz tiene una columna
  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %

  % COMPROBACION DE LAS DIMENSIONES
  [f_a,c_a] = size(a);
  [f_b,c_b] = size(b);
  
  if f_a ~= c_a
    
    % ERROR DEBIDO A MAL TAMAÑO DE LA MATRIZ
    % DE COEFICIENTES a
    error("LAS MATRICES NO SON CUADRADAS")
  
  elseif c_a ~= f_b
    
    % ERROR DEBIDO A MAL TAMAÑO DE LA MATRIZ
    % DE ESTIMULOS b
    error("LAS MATRICES NO TIENEN TAMAÑOS COMPATIBLES")
    
  else 
    
   % CREAR MATRIZ AUMENTADA
    A = [a b];
    
    % NUMERO DE FILAS EN n
    n = f_a;
    
    % NUMERO DE COLUMNAS EN m
    m = n+c_b;
    
    % MAXIMO POR FILAS
    a_max = max(abs(A(:,1:n)),[],2);
    
  end  

  for k = 1:(n-1)
    
    % CALCULO DEL MAXIMO Y SU POSICION
    [v,p] = max(abs(A(k:n,k))./a_max(k:n,1));
    p = p+k-1;
    
    if (v < eps)
      
      error("Matriz Singular")
      
    end  
    
    % EN CASO DE QUE p NO COINCIDA CON k 
    % PERMUTE LAS FILAS
    if (p ~= k)
      
      A([p k],k:m) = A([k p],k:m);
      a_max([p k],1) = a_max([k p],1);
      
    end  
   
    % PROCESO DE TRIANGULACION
    ind1 = [false(k,1); A((k+1):n,k) ~= 0];
    A(ind1,k:m) = A(ind1,k:m)-(A(ind1,k)/A(k,k))*A(k,k:m);
    
  end 

  
  X = SustitucionAtras(A);

end

% Lic. Pedro Antonio Peralta Regalado
% pedrinto91@gmail.com