function X = SustitucionAdelante(A,L_fact)

  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
  %
  % IMPLEMENTACIÓN COMPUTACIONAL DEL PROCEDIMIENTO 
  % DE SOLUCIÓN DE MATRICES TRIANGULADAS INFERIORES
  % 
  % Considere el sistema:
  % aX = b
  % donde a es una matriz triangulada superior
  % a: [a11, 0, ..., 0; a21, 0, ..., 0; ...; an1, an2, ..., 0]
  % b: [b11 b12 ... b1m; b21 ... b2n; ...; bn1 bn2 ... bnm]
  % La matriz A está relacionada con las anteriores, mediante
  % A: [a b]
  %
  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
  
  % PROCESO DE SUSTITUCION HACIA ADELANTE
  [n,m] = size(A);
  ind = (n+1):m;
  if L_fact == 1
    
    for k = 1:n
      
      A(k,ind) = A(k,ind)-A(k,1:(k-1))*A(1:(k-1),ind);
      
    end
    
  else 
    
    for k = 1:n
      
      A(k,ind) = (A(k,ind)-A(k,1:(k-1))*A(1:(k-1),ind))/A(k,k);
      
    end
    
  end  
  % EXTRAYENDO LA SOLUCION
  X = A(:,ind);
  
end

% Pedro Antonio Peralta Regalado
% pedrinto91@gmail.com