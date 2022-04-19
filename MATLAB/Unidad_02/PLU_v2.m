function A = PLU_v2(a)  
  
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
  
  if f_a ~= c_a
    
    % ERROR DEBIDO A MAL TAMAÑO DE LA MATRIZ
    % DE COEFICIENTES a
    error("LAS MATRICES NO SON CUADRADAS")
    
  else 
   
    % NUMERO DE FILAS EN n
    n = f_a;
    
    % CREAR MATRIZ AUMENTADA
    A = [a (1:n).' max(abs(a),[],2)];
    
  end  

  for k = 1:(n-1)
    
    % CALCULO DEL MAXIMO Y SU POSICION
    [v,p] = max(abs(A(k:n,k))./A(k:n,n+2));
    p = p+k-1;
    
    if (v < eps)
      
      error("Matriz Singular")
      
    end  
    
    % EN CASO DE QUE p NO COINCIDA CON k 
    % PERMUTE LAS FILAS
    if (p ~= k)
      
      A([p k],:) = A([k p],:);
      
    end  
   
    % PROCESO DE TRIANGULACION
    ind1 = [false(k,1); A((k+1):n,k) ~= 0];
    A(ind1,k) = A(ind1,k)/A(k,k);
    A(ind1,(k+1):n) = A(ind1,(k+1):n)-A(ind1,k)*A(k,(k+1):n);
    
  end 

end

% Lic. Pedro Antonio Peralta Regalado
% pedrinto91@gmail.com