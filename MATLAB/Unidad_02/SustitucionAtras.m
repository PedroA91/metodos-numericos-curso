function X = SustitucionAtras(A)
  
  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
  %
  % IMPLEMENTACIÓN COMPUTACIONAL DEL PROCEDIMIENTO 
  % DE SOLUCIÓN DE MATRICES TRIANGULADAS SUPERIORES
  % 
  % Considere el sistema:
  % aX = b
  % donde a es una matriz triangulada superior
  % a: [a11, a12, ..., a1n; 0, a21, ..., a2n; ...; 0, 0, ..., ann]
  % b: [b11 b12 ... b1m; b21 ... b2n; ...; bn1 bn2 ... bnm]
  % La matriz A está relacionada con las anteriores, mediante
  % A: [a b]
  %
  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
  
  % PROCESO DE SUSTITUCION HACIA ATRAS
  [n,m] = size(A);
  ind = (n+1):m;
  
  for k = n:-1:1
    
    A(k,ind) = (A(k,ind)-A(k,(k+1):n)*A((k+1):n,ind))/A(k,k);
    
  end
  
  % EXTRAYENDO LA SOLUCION
  X = A(:,ind);
  
end

% Lic. Pedro Antonio Peralta Regalado
% pedrinto91@gmail.com