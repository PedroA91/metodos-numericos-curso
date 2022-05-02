function dA = determinante(a)

  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
  % FUNCIÓN PARA CALCULAR EL DETERMINANTE
  % 
  % a: es la matriz con determinante por calcular
  %
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
    q = 1;
    % CREAR MATRIZ AUMENTADA
    A = [a (1:n).' max(abs(a(:,:)),[],2)];
    
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
      q = -q;
      
    end  
   
    % PROCESO DE TRIANGULACION
    
    for j = (k+1):n
    
      if A(j,k) ~= 0
        
       v = A(j,k)/A(k,k);
       A(j,k:n) = A(j,k:n)-v*A(k,k:n);
       
      end 
    
    end  
    
  end
  
  % CALCULO DEL DETERMINANTE 
  % POR MULTIPLICACIÓN DE LA DIAGONAL
  dA = q*prod(diag(A));

end
