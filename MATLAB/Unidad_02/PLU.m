function A = PLU(a)
   % FUNCION QUE IMPLEMENTA LA FACTORIZACION PLU 
   % USANDO EL ESQUEMA PIVOTEO PARCIAL Y ESCALAMIENTO
   %
   % Considere el sistema Pa = LU
   % a: matriz a factorizar
 
  % COMPROBACION DE LAS DIMENSIONES
  [f_a,c_a] = size(a);

  if f_a ~= c_a
    
    % ERROR DEBIDO A MAL TAMAÑO DE LA MATRIZ
    % DE COEFICIENTES a
    error("LAS MATRICES NO SON CUADRADAS")
  
  else 

    % NUMERO DE FILAS EN n
    % NUMERO DE COLUMNAS EN m
    n = f_a;
    m = n+1;
    % CREAR MATRIZ AUMENTADA
    A = [a (1:n).'];

  end 

  % MAXIMO POR FILAS
  a_max = max(abs(A(:,:)),[],2);

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
    
    for j = (k+1):n
    
      if A(j,k) ~= 0
        
       c = A(j,k)/A(k,k);
       A(j,(k+1):n) = A(j,(k+1):n)-c*A(k,(k+1):n);
       A(j,k) = c;

      end 
    
    end  
    
  end

end