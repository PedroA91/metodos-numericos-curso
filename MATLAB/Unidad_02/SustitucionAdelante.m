function X = SustitucionAdelante(A)
  
  % PROCESO DE SUSTITUCION HACIA ATRAS
  [n,m] = size(A);
  
  for k = 1:n
    
    A(k,(n+1):m) = (A(k,(n+1):m)-A(k,1:(k-1))*A(1:(k-1),(n+1):m))/A(k,k);
    
  end
  
  % EXTRAYENDO LA SOLUCION
  X = A(:,(n+1):m);
  
end

% Pedro Antonio Peralta Regalado
% pedrinto91@gmail.com