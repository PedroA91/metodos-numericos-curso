function X = SustitucionAtras(A)
  
  % PROCESO DE SUSTITUCION HACIA ATRAS
  [n,m] = size(A);
  
  for k = n:-1:1
    
    A(k,(n+1):m) = (A(k,(n+1):m)-A(k,(k+1):n)*A((k+1):n,(n+1):m))/A(k,k);
    
  end
  
  % EXTRAYENDO LA SOLUCION
  X = A(:,(n+1):m);
  
end

% Pedro Antonio Peralta Regalado
% pedrinto91@gmail.com