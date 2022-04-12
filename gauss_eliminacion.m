function x = gauss_eliminacion(a,b)
  % FUNCION QUE IMPLEMENTA LAS ELIMINACIONES GAUSSIANAS 
    % USANDO EL ESQUEMA PIVOTEO PARCIAL Y ESCALAMIENTO
    %
    % Considere el sistema aX=b
    % a: matriz de coeficientes
    % b: matriz de estimulos 
 
  % COMPROBACION DE LAS DIMENSIONES
  [f_a,c_a] = size(a);
  [f_b,c_b] = size(b);

  if f_a ~= c_a
    
    error("LAS MATRICES NO SON CUADRADAS")
  
  elseif c_a ~= f_b
    
    error("LAS MATRICES NO TIENEN TAMAÑOS COMPATIBLES")

  else 

   % CREAR MATRIZ AUMENTADA
    A = [a b];

  end  

  % NUMERO DE FILAS EN n
  % NUMERO DE COLUMNAS EN m
  n = f_a;
  m = n+c_b;

  % MAXIMO POR FILAS
  a_max = max(abs(A(:,1:n)),[],2);

  for k = 1:(n-1)
    
    % CALCULO DEL MAXIMO Y SU POSICION
    [v,p] = max(abs(A(k:n,k))./a_max(k:n,1));
    p = p+k-1;
    
    if (v < eps)
      
      error("Matriz Singular")
      
    end  
    
    % EN CASO DE QUE p NO COINCIDA CON LA k DE 
    if (p ~= k)
      
      A([p k],k:m) = A([k p],k:m);
      a_max([p k],1) = a_max([k p],1);
      
    end  
   
    % TRIANGULACION
    
    for j = (k+1):n
    
      if A(j,k) ~= 0
        
       c = A(j,k)/A(k,k);
       A(j,k:m) = A(j,k:m)-c*A(k,k:m);
       
      end 
    
    end  
    
  end

  % PLANTEAR LA UNICIDAD
  r = diag(A);
  if sum(abs(r) < eps) ~= 0
    
    error("No hay unicidad en la solucion")
    
  end  

  % PROCESO DE SUSTITUCION HACIA ATRAS
  for k = n:-1:1
    
    A(k,(n+1):m) = (A(k,(n+1):m)-A(k,(k+1):n)*A((k+1):n,(n+1):m))/A(k,k);
    
  end

  x = A(:,(n+1):m);

end