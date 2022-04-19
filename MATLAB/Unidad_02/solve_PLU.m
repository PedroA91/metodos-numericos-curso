function X = solve_PLU(A,b)

  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %
  % SOLUCION DE UN SISTEMA DE ECUACIONES LINEALES
  % UTILIZANDO FACTORIZACION PLU
  %
  % A: Matriz de coeficientes factorizada obtenida de PLU.m
  % b: Matriz de estimulos, por cada sistema hay una columna
  %
  %  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  %

  n = length(A(:,1));
  Z = SustitucionAdelante([tril(A(:,1:n),-1)+eye(n) b(A(:,n+1),:)],1);
  X = SustitucionAtras([triu(A(:,1:n)) Z]);
  
end
